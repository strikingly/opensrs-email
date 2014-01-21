require "opensrs/email/version"

require 'socket'
require 'openssl'
require 'logger'

LOGGER = Logger.new(STDOUT)
LOGGER.level = Logger::INFO

module Opensrs
  module Email
    class Gateway
      def initialize(server, port, user, domain, password, version = '3.4', logger = LOGGER)
        @server = server
        @port = port
        @user = user
        @domain = domain
        @password = password
        @version = version
        @logger = logger
        @loggedin = false

        open_connection

        response = receive_response
        @logger.info("Initial response:\n#{response}")
        
        response = send_version
        @logger.info("Version response:\n#{response}")
        
        response = login
        @logger.info("Login response:\n#{response}")

        if /^OK.*/ =~ response
          @loggedin = true
        else
          @loggedin = false
        end
      end

      def loggedin?
        @loggedin
      end

      def open_connection
        @connection = TCPSocket.new(@server, @port)
        @socket = OpenSSL::SSL::SSLSocket.new(@connection) if @connection

        @socket.sync_close = true # synchronise connection close of ssl layer and underlying tcp socket
        @socket.connect
      end

      def send_version
        command = "VER VER=\"#{@version}\"\r\n.\r\n"
        send_command(command)
        receive_response
      end

      def login
        command = "LOGIN USER=\"#{@user}\" DOMAIN=\"#{@domain}\" PASSWORD=\"#{@password}\"\r\n.\r\n"
        send_command(command)
        receive_response
      end

      def quit
        command = "QUIT\r\n.\r\n"
        send_command(command)
      end
      
      def close_connection
        @socket.close if @socket and not @socket.closed?
        @connection.close if @connection and not @connection.closed?

        @socket = @connection = nil
      end

      def call(command, attributes = {})
        cmd = command.to_s
        attr = attributes.map {|k, v|
          "#{k.to_s}=\"#{v.to_s}\""
        } .join(' ')
        cmd << " #{attr}"
        cmd = "#{cmd}\r\n.\r\n"
        send_command(cmd)
        receive_response.split("\r\n")
      end

      def send_command(command)
        if @socket and not @socket.closed?
          @logger.info("Sending command:\n#{command}")
          @socket.write(command)
        end
      end

      def receive_response
        build_response("")
      end

      def build_response(partial)
        line = receive_line
        if line == ".\r\n"
          partial
        else
          build_response(partial + line)
        end
      end

      def receive_line
        @socket.gets
      end
    end
  end
end
require 'socket'
require 'colorized_string' 
system('color 0e')
begin
    def easter_egg()
	 puts "
         ░░░░░██╗██╗░██████╗░░██████╗░░█████╗░
         ░░░░░██║██║██╔════╝░██╔════╝░██╔══██╗
         ░░░░░██║██║██║░░██╗░██║░░██╗░███████║
         ██╗░░██║██║██║░░╚██╗██║░░╚██╗██╔══██║
         ╚█████╔╝██║╚██████╔╝╚██████╔╝██║░░██║
         ░╚════╝░╚═╝░╚═════╝░░╚═════╝░╚═╝░░╚═╝
	 big penis: 1   |  ma jig: true  |  is denya: true B)
	 gangsta: true  |  mr deam: fal  |
	 
	 "
	 puts terminal()
	end
	
    def banner()
	 puts terminal_main()
	end
	
    def clearscreen()
	 system('cls')
	 puts terminal()
	end
	
    def port_scanner()
	
	 puts "input a host:"
     inp_hostname = gets.chomp
     hostname = inp_hostname
     port = 0
	    def scanner(host, port_func)
            while port_func < 1025
	            begin
                 sock = TCPSocket.new(host, port_func) 
		         puts "Open: " + port_func.to_s	
                 port_func += 1		   
                 sock.close
		        rescue Errno::ECONNREFUSED, Errno::ETIMEDOUT, Errno::EADDRNOTAVAIL
		         port_func += 1
		        end
			    puts "Closed: " + port_func.to_s
            end		
 	    end	
		puts scanner(hostname, port) 
	end
	
    def back_a_dir()
     parent_dir = File.expand_path('../.')
     Dir.chdir(parent_dir)
     puts terminal()
    end

    def exit()
     puts "exiting..."
     system 'exit'
    end

    def help() 
     puts "\n"
     puts "help - help command to display all commands and args"
     puts "file (arg1:arg2) , example file w:r"
     puts "che - check what dir you in"
     puts "mvto - move to a different dir (.. : down a dir)"
	 puts "scanner - scanner.arg_type , example scanner.port_1024"
	 puts "clearscreen - clears the screen"
     puts "\n"	
     puts terminal()
    end

    def check_dir()
     system('dir')
     puts terminal()
    end

    def move_to_dir() # 
     puts "inp dir to goto: "
     inp_dir = gets.chomp()
     if_dir_exist = Dir.exist?(inp_dir)
        if if_dir_exist
         Dir.chdir(inp_dir)
         puts terminal()
        else
         puts "404ERROR: Dir does not exist" #if if_dir_exist = false
         puts terminal() 
        end
    end

    def write_and_read_file() 
     puts "write the file name: "
     inp_file = gets.chomp()            #file
     puts "write text you want to add: "
     inp_text = gets.chomp()            #text

     system 'cls' #clear the screen

     puts "if you want to exit you can do Ctrl + c"

        if File::exists?(inp_file) 
         myfile = open(inp_file, "a+")
         myfile.write("\n")
         myfile.write(inp_text) 
         puts("text was put into the file succesfully!") 
         myfile.close()                                          #close file for writing (at end)
            File.open(inp_file, "r") do |myfile| #read file fully 
             length = File.size(myfile)
             puts(length)
             puts myfile.readlines[0..length]
             puts terminal()
		    end
        else
         puts ("404ERROR: File does not exist") #if exists? = false 
         puts terminal()
        end
    end


    def terminal_main()
	 print ColorizedString["
	 ██████╗░███████╗███╗░░██╗██╗░░░██╗░█████╗░░██████╗██╗██████╗░███████╗
         ██╔══██╗██╔════╝████╗░██║╚██╗░██╔╝██╔══██╗██╔════╝██║██╔══██╗██╔════╝
         ██║░░██║█████╗░░██╔██╗██║░╚████╔╝░███████║╚█████╗░██║██║░░██║█████╗░░
         ██║░░██║██╔══╝░░██║╚████║░░╚██╔╝░░██╔══██║░╚═══██╗██║██║░░██║██╔══╝░░
         ██████╔╝███████╗██║░╚███║░░░██║░░░██║░░██║██████╔╝██║██████╔╝███████╗
         ╚═════╝░╚══════╝╚═╝░░╚══╝░░░╚═╝░░░╚═╝░░╚═╝╚═════╝░╚═╝╚═════╝░╚══════╝
	 Server  : 0  |  Scanners: 1  |  Payloads: 0
         Exploits: 0  |  Client  : 2  | 
	 "].colorize(:light_green).on_black
     dir = system('cd')  
	 print ColorizedString["dst"].colorize(:blue).on_black.underline
	 print ColorizedString[" !> "].colorize(:blue).on_black
     input = gets.chomp()
	    if input == "che"
	     puts check_dir()
	    elsif input == "mvto"
	     puts move_to_dir()
	    elsif input == "file write"
	     puts write_and_read_file()
	    elsif input == "help"
	     puts help()
	    elsif input == "logout"
	     puts exit()
	    elsif input == "mvto.."
	     puts back_a_dir()
		elsif input == "scanner.port_1024"
		 puts port_scanner()
		elsif input == "clearscreen"
		 puts clearscreen()
		elsif input == "banner"
		 puts banner()
		elsif input == "no more cuss words guis)))"
		 puts easter_egg()
	    else
         puts ColorizedString["404ERROR: Invalid command plz try again"].colorize(:light_red).on_black       # else input = invalid
	     puts terminal_main()
	    end
    end
   
    def terminal()
     dir = system('cd')  
	 print ColorizedString["dst"].colorize(:blue).on_black.underline
	 print ColorizedString[" !> "].colorize(:blue).on_black
     input = gets.chomp()
	    if input == "che"
	     puts check_dir()
	    elsif input == "mvto"
	     puts move_to_dir()
	    elsif input == "file (w:r)"
	     puts write_and_read_file()
	    elsif input == "help"
	     puts help()
	    elsif input == "logout"
	     puts exit()
	    elsif input == "mvto.."
	     puts back_a_dir()
		elsif input == "scanner.port_1024"
		 puts port_scanner()
		elsif input == "clearscreen"
		 puts clearscreen()
		elsif input == "banner"
		 puts banner()
		elsif input == "no more cuss words guis)))"
		 puts easter_egg()
	    else
         puts ColorizedString["404ERROR: Invalid command plz try again"].colorize(:light_red).on_black       # else input = invalid
	     puts terminal()
	    end
    end
   
    puts terminal_main()
	
rescue Interrupt
 puts ColorizedString["User pressed Ctrl+c"].colorize(:light_red).on_black
rescue NoMethodError
 puts ColorizedString["NOMETHODERROR: idk this error i just captured it to make my terminal look more smart"].colorize(:light_red).on_black
end
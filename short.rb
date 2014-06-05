require 'gtk3'
require 'googl'

class RubyApp < Gtk::Window

    def initialize
        super
            
        init_ui
    end
    def init_ui
		
        fixed = Gtk::Fixed.new
        add fixed
        #Quit button code start
        button = Gtk::Button.new :label => "Quit"
        button.set_size_request 80, 35      
        button.signal_connect "clicked" do 
            Gtk.main_quit 
        end
        #Quit button code end
        #Short URL button code start
        ok = Gtk::Button.new :label => "Short URL"
        ok.set_size_request 80, 35      
        ok.signal_connect "clicked" do 
			@l = @edit.text.length
			unless @edit.text == "" or @edit.text ==  " "*@l or @edit.text ==  "."*@l
			@e = Googl.shorten(@edit.text).short_url 
            @short.set_text @e
			else
            @short.set_text "Error please input a valid url"
            end
        end
        #Short URL button code end
        #Short URL Entry code start
        @edit = Gtk::Entry.new
        @edit.set_size_request 200, 35
        @short = Gtk::Entry.new
        @short.set_size_request 200, 35
        #Short URL Entry code end      
        fixed.put button, 150, 140
        fixed.put @edit ,50,20
        fixed.put @short ,50,80
        fixed.put ok, 50, 140
        set_title  "Short URL !"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end        

        set_default_size 300, 200
        set_window_position(:center)
        show_all
    end
end

Gtk.init
    window = RubyApp.new
Gtk.main

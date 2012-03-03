// http://www.gtkforums.com/viewtopic.php?f=3&t=55305
public class TabbedWindow : Gtk.Window {

    public void append_notebook_page (string icon_name)
    {
      var page      = new Gtk.Image.from_stock (icon_name, Gtk.IconSize.DIALOG);
      var hbox      = new Gtk.HBox (false, 5);
      var label     = new Gtk.Label (@"Icon $icon_name");
      var close_but = new Gtk.Button ();
      var icon      = new Gtk.Image.from_stock (Gtk.Stock.CLOSE, Gtk.IconSize.MENU);

      close_but.add (icon);
      close_but.set_relief(Gtk.ReliefStyle.NONE);
      close_but.clicked.connect(() => { notebook.remove_page (notebook.page_num (page)); });

      hbox.pack_start (label, false, false, 0);
      hbox.pack_start (close_but, false, false, 0);

      notebook.append_page (page, hbox);
      notebook.show_all ();
      hbox.show_all();
    }

    public Gtk.Notebook notebook;

    public TabbedWindow()
    {
        destroy.connect (Gtk.main_quit);

        this.notebook = new Gtk.Notebook ();

        add (this.notebook);

        append_notebook_page (Gtk.Stock.FLOPPY);
        append_notebook_page (Gtk.Stock.HARDDISK);
        append_notebook_page (Gtk.Stock.PRINT);
        append_notebook_page (Gtk.Stock.CUT);
    }

    static int main (string[] args)
    {
        Gtk.init(ref args);

        var tw = new TabbedWindow();
        tw.show_all();

        Gtk.main ();

        return 0;
    }
}

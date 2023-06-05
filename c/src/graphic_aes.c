#include <stdlib.h>
#include <gtk/gtk.h>

#include "graphic_aes.h"
#include "io.h"
#include "callbacks.h"





void graphicAes(int argc, char **argv){
    // Interface graphique

    gtk_init(&argc, &argv);

    GtkWidget *p_button_open = NULL;
    GtkWidget *p_label_open = NULL;

    // fenetre principale
    GtkWidget *p_window = NULL;
    p_window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_title(GTK_WINDOW(p_window), "AES");
    g_signal_connect (G_OBJECT (p_window), "destroy", G_CALLBACK (gtk_main_quit), NULL);

    //conteneur principal vertical
    GtkWidget *p_main_box_vertical = NULL;
    p_main_box_vertical = gtk_vbox_new(FALSE, 10);
    gtk_container_add(G_OBJECT (p_window), p_main_box_vertical);

    //conteneur principal horizontal
    GtkWidget *p_main_box_horizontal = NULL;
    p_main_box_horizontal = gtk_hbox_new(FALSE, 50);
    gtk_container_add(G_OBJECT (p_main_box_vertical), p_main_box_horizontal);

    //conteneur choix fichiers
    GtkWidget *p_choose_file_box = NULL;
    p_choose_file_box = gtk_vbox_new(FALSE, 20);
    gtk_container_add(G_OBJECT (p_main_box_horizontal), p_choose_file_box);

    //conteneur droite
    GtkWidget *p_right_box = NULL;
    p_right_box = gtk_vbox_new(FALSE, 10);
    gtk_container_add(G_OBJECT (p_main_box_horizontal), p_right_box);


    // bouton
    GtkWidget *p_button = NULL;
    p_button = gtk_button_new_with_label ("quitter");
    g_signal_connect(G_OBJECT (p_button), "clicked", G_CALLBACK (gtk_main_quit), NULL);
    gtk_box_pack_end(GTK_BOX (p_main_box_vertical), p_button, FALSE, FALSE, 10);

    p_label_open = gtk_label_new ("no file");

    //bouton encoder
    GtkWidget *p_button_encode = NULL;
    p_button_encode = gtk_button_new_with_label ("encoder");
    g_signal_connect(G_OBJECT(p_button_encode), "clicked", G_CALLBACK(cb_encode), NULL);
    gtk_box_pack_end(GTK_BOX (p_right_box), p_button_encode, FALSE, FALSE, 10);


    //label titre choix fichiers
    GtkWidget *p_label_choix = NULL;
    p_label_choix = gtk_label_new ("CHOIX DE FICHIERS");
    gtk_box_pack_start(GTK_BOX (p_choose_file_box), p_label_choix, FALSE, FALSE, 10);

    // bouton open
    p_label_open = gtk_label_new ("no file");
    p_button_open = gtk_button_new_with_label("ouvrir");
    g_signal_connect (G_OBJECT (p_button_open), "clicked", G_CALLBACK (cb_ouvertureFichier), p_label_open);
    gtk_box_pack_start(GTK_BOX (p_choose_file_box), p_button_open, FALSE, FALSE, 0);

    //label ouverture
    gtk_box_pack_start(GTK_BOX (p_choose_file_box), p_label_open, FALSE, FALSE, 10);


    // bouton save
    GtkWidget *p_button_save = NULL;
    GtkWidget *p_label_save = NULL;
    p_label_save = gtk_label_new ("no file");
    p_button_save = gtk_button_new_with_label("save");
    g_signal_connect (G_OBJECT (p_button_save), "clicked", G_CALLBACK (cb_enregistrementFichier), p_label_save);
    gtk_box_pack_start(GTK_BOX (p_choose_file_box), p_button_save, FALSE, FALSE, 0);

    //label save
    gtk_box_pack_end(GTK_BOX (p_choose_file_box), p_label_save, FALSE, FALSE, 10);

/*
    // bouton 4
    GtkWidget *p_button4 = NULL;
    p_button4 = gtk_button_new_with_label ("coucou4");
    g_signal_connect(G_OBJECT (p_button4), "clicked", G_CALLBACK (gtk_main_quit), NULL);
    gtk_box_pack_end(GTK_BOX (p_main_box), p_button4, FALSE, FALSE, 10);

*/




    gtk_widget_show_all(p_window);
    gtk_widget_show(p_window);
    gtk_main();
    return EXIT_SUCCESS;
}
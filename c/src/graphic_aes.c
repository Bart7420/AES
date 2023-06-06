#include <stdlib.h>
#include <gtk/gtk.h>
#include <vte/vte.h>
#include <gio/gio.h>

#include "graphic_aes.h"
#include "io.h"
#include "callbacks.h"
#include "cbc.h"






void getEntree(char *gentree) {
  strcpy(gentree, entree);
}
void getSortie(char *gsortie) {
  strcpy(gsortie, entree);
}
void setEntree(char *sentree) {
  strcpy(entree, sentree);
}
void setSortie(char *ssortie) {
  strcpy(sortie, ssortie);
}


int main(int argc, char **argv){
    
    
    // Interface graphique

    gtk_init(&argc, &argv);

    struct Widgets widgets;
    
  
    // fenetre principale
    
    widgets.p_window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_title(GTK_WINDOW(widgets.p_window), "AES");
    g_signal_connect (G_OBJECT (widgets.p_window), "destroy", G_CALLBACK (gtk_main_quit), NULL);

    //conteneur principal vertical
    widgets.p_main_box_vertical = gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_container_add(G_OBJECT (widgets.p_window), widgets.p_main_box_vertical);

    //conteneur principal horizontal
    widgets.p_main_box_horizontal = gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 50);
    gtk_box_set_homogeneous(widgets.p_main_box_horizontal, TRUE);
    gtk_container_add(G_OBJECT (widgets.p_main_box_vertical), widgets.p_main_box_horizontal);

    //conteneur choix fichiers
    widgets.p_choose_file_box = gtk_box_new(GTK_ORIENTATION_VERTICAL, 20);
    gtk_container_add(G_OBJECT (widgets.p_main_box_horizontal), widgets.p_choose_file_box);

    //conteneur droite
    widgets.p_right_box = gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    //gtk_box_set_homogeneous(p_right_box, TRUE);
    gtk_container_add(G_OBJECT (widgets.p_main_box_horizontal), widgets.p_right_box);


    // bouton
    widgets.p_button = gtk_button_new_with_label ("quitter");
    g_signal_connect(G_OBJECT (widgets.p_button), "clicked", G_CALLBACK (gtk_main_quit), NULL);
    gtk_box_pack_end(GTK_BOX (widgets.p_main_box_vertical), widgets.p_button, FALSE, FALSE, 10);
    widgets.p_label_open = gtk_label_new ("no file");

    //bouton encoder
    widgets.p_button_encode = gtk_button_new_with_label("encoder");
    gtk_box_pack_end(GTK_BOX (widgets.p_right_box), widgets.p_button_encode, FALSE, FALSE, 10);


    //bouton decoder
    widgets.p_button_decode = gtk_button_new_with_label("decoder");
    gtk_box_pack_end(GTK_BOX (widgets.p_right_box), widgets.p_button_decode, FALSE, FALSE, 10);

    //label titre choix fichiers
    widgets.p_label_choix = gtk_label_new ("CHOIX DE FICHIERS");
    gtk_box_pack_start(GTK_BOX (widgets.p_choose_file_box), widgets.p_label_choix, FALSE, FALSE, 10);

    // bouton open
    widgets.p_label_open = gtk_label_new ("no file");
    widgets.p_button_open = gtk_button_new_with_label("ouvrir");
    g_signal_connect (G_OBJECT (widgets.p_button_open), "clicked", G_CALLBACK (cb_ouvertureFichier), &widgets);
    




    //label ouverture
    

    //label cle
    widgets.p_label_cle = gtk_label_new ("Clé :");
    
    // champ de clé
    widgets.p_text = gtk_entry_new();
    
    gtk_entry_set_placeholder_text(GTK_ENTRY(widgets.p_text),"Clé");


    // bouton save
    widgets.p_label_save = gtk_label_new ("no file");
    widgets.p_button_save = gtk_button_new_with_label("save");
    g_signal_connect (G_OBJECT (widgets.p_button_save), "clicked", G_CALLBACK (cb_enregistrementFichier), &widgets);

    //label save


    g_signal_connect(G_OBJECT(widgets.p_button_encode), "clicked", G_CALLBACK(cb_encode), &widgets);
    g_signal_connect(G_OBJECT(widgets.p_button_decode), "clicked", G_CALLBACK(cb_decode), &widgets);
    gtk_box_pack_start(GTK_BOX (widgets.p_choose_file_box), widgets.p_label_cle, FALSE, FALSE, 10);
    gtk_box_pack_start(GTK_BOX (widgets.p_choose_file_box), widgets.p_text, FALSE, FALSE, 10);
    gtk_box_pack_start(GTK_BOX (widgets.p_choose_file_box), widgets.p_button_open, FALSE, FALSE, 0);
    gtk_box_pack_start(GTK_BOX (widgets.p_choose_file_box), widgets.p_label_open, FALSE, FALSE, 10);
    gtk_box_pack_start(GTK_BOX (widgets.p_choose_file_box), widgets.p_button_save, FALSE, FALSE, 0);
    gtk_box_pack_start(GTK_BOX (widgets.p_choose_file_box), widgets.p_label_save, FALSE, FALSE, 10);


    widgets.p_vte = vte_terminal_new();
    gtk_box_pack_start(GTK_BOX (widgets.p_right_box), widgets.p_vte, FALSE, FALSE, 10);


    //GTask *task = NULL;
    //task = g_task_new(NULL, NULL, cb_exit, &widgets);
    //g_task_set_task_data(NULL, NULL, NULL);








/*
    // bouton 4
    GtkWidget *p_button4 = NULL;
    p_button4 = gtk_button_new_with_label ("coucou4");
    g_signal_connect(G_OBJECT (p_button4), "clicked", G_CALLBACK (gtk_main_quit), NULL);
    gtk_box_pack_end(GTK_BOX (p_main_box), p_button4, FALSE, FALSE, 10);

*/  

    




    gtk_widget_show_all(widgets.p_window);
    gtk_widget_show(widgets.p_window);
    gtk_main();
    return EXIT_SUCCESS;
}
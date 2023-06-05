
#include <stdlib.h>
#include <gtk/gtk.h>

//#include "main.h"

extern char entree[100];
extern char sortie[100];

// sortie du programme
void cb_exit(GtkWidget *p_widget, gpointer label) {
  gtk_main_quit(); // fonction de base de gtk qui kill tous les composants

    // ajouter ici tous les autres élements à libérer à la fin


    // var non utilisées
  (void)p_widget;
  (void)label;
}


void cb_encode(GtkWidget *appelant, gpointer *label) {

    //char *test;
    //test = gtk_label_get_text(label);
    //g_print("%s\n",test);

    //char entree[100];
    //char sortie[100];
    //getEntree(entree);
    //getSortie(sortie);
    //g_print("%s\n", entree);
    //g_print("%s\n", sortie);

    ecriture();

    (void) appelant;
}


void cb_ouvertureFichier (GtkWidget *appelant, gpointer *label) {
  GtkWidget *p_dialog = NULL;
  p_dialog = gtk_file_chooser_dialog_new ("files", NULL,
                                          GTK_FILE_CHOOSER_ACTION_OPEN, // mode ouverture de fichier
                                          "Cancel", GTK_RESPONSE_CANCEL, // type du premier bouton, label de sortie si choisi
                                          "Open", GTK_RESPONSE_ACCEPT, // type du second bouton, label de sortie si choisi
                                          NULL); // pas de prochain bouton
  if (gtk_dialog_run (GTK_DIALOG (p_dialog)) == GTK_RESPONSE_ACCEPT) { // si on a cliqué sur ouvrir
    gchar *file_name = NULL; // creer le conteneur qui va prendre le nom du fichier
    file_name = gtk_file_chooser_get_filename (GTK_FILE_CHOOSER (p_dialog)); // recuperer le nom fu fichier de la boite de dialogue
    gtk_label_set_text(GTK_LABEL(label), file_name); // mettre a jour le lable du "textview" avec le chemin du fichier
    //char entree[100];
    strcpy((entree), file_name);
    g_free (file_name), file_name = NULL;
  }
  gtk_widget_destroy(p_dialog);
  (void)appelant; // on s'en sert pas
}


void cb_enregistrementFichier (GtkWidget *appelant, gpointer *label) {
  GtkWidget *p_dialog = NULL;
  p_dialog = gtk_file_chooser_dialog_new ("files", NULL,
                                          GTK_FILE_CHOOSER_ACTION_SAVE, // mode ouverture de fichier
                                          "Cancel", GTK_RESPONSE_CANCEL, // type du premier bouton, label de sortie si choisi
                                          "Open", GTK_RESPONSE_ACCEPT, // type du second bouton, label de sortie si choisi
                                          NULL); // pas de prochain bouton
  if (gtk_dialog_run (GTK_DIALOG (p_dialog)) == GTK_RESPONSE_ACCEPT) { // si on a cliqué sur ouvrir
    gchar *file_name = NULL; // creer le conteneur qui va prendre le nom du fichier
    file_name = gtk_file_chooser_get_filename (GTK_FILE_CHOOSER (p_dialog)); // recuperer le nom fu fichier de la boite de dialogue
    gtk_label_set_text(GTK_LABEL(label), file_name); // mettre a jour le lable du "textview" avec le chemin du fichier
    //char sortie[100];
    strcpy((sortie), file_name);
    g_free (file_name), file_name = NULL;
  }
  gtk_widget_destroy(p_dialog);
  (void)appelant; // on s'en sert pas
}

#include <stdlib.h>
#include <gtk/gtk.h>
#include "callbacks.h"
#include "io.h"

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

    //key = gtk_entry_get_text(label);
    //chiffrer_cbc();

/*
    int len = 12;
    byte *test = lecture(&len);
    afficher_state(test);
    printf("taille : %d\n", len);nflit de fusion dans c/graphic_aes
    printf("tailek :: %d\n", gtk_entry_get_text_length(label));
    printf("clé :: %s\n", gtk_entry_get_text(label));

  */

    int taille_cle = (int) gtk_entry_get_text_length(label);
    char *cle = gtk_entry_get_text(label);
    int ok = 0;
    if ((taille_cle ==32) || (taille_cle == 48) || (taille_cle == 92)) {
      // on encode si :
      for (int i =0; i<taille_cle; i++) {
        if ((cle[i] == '0') || (cle[i] == '1') || (cle[i] == '2') || (cle[i] == '3') || (cle[i] == '4') || (cle[i] == '5') || (cle[i] == '6') || (cle[i] == '7') || (cle[i] == '8') || (cle[i] == '9') || (cle[i] == 'a') || (cle[i] == 'b') || (cle[i] == 'c') || (cle[i] == 'd') || (cle[i] == 'e') || (cle[i] == 'f') ) {
            // on encode
            ok = 1;
        } 
      }
    }
    if (ok == 1) {
      chiffrer_cbc();
    }
    (void) appelant;
}


void cb_decode(GtkWidget *appelant, gpointer *label) {



    int taille_cle = (int) gtk_entry_get_text_length(label);
    char *cle = gtk_entry_get_text(label);
    int ok = 0;
    if ((taille_cle ==32) || (taille_cle == 48) || (taille_cle == 92)) {
      // on encode si :
      for (int i =0; i<taille_cle; i++) {
        if ((cle[i] == '0') || (cle[i] == '1') || (cle[i] == '2') || (cle[i] == '3') || (cle[i] == '4') || (cle[i] == '5') || (cle[i] == '6') || (cle[i] == '7') || (cle[i] == '8') || (cle[i] == '9') || (cle[i] == 'a') || (cle[i] == 'b') || (cle[i] == 'c') || (cle[i] == 'd') || (cle[i] == 'e') || (cle[i] == 'f') ) {
            // on encode
            ok = 1;
        } 
      }
    }
    if (ok == 1) {
      dechiffrer_cbc();
    }
    

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
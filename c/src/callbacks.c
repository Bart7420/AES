
#include <stdlib.h>
#include <gtk/gtk.h>
#include <vte/vte.h>
#include <stdio.h>
#include <time.h>
#include <math.h>


#include "callbacks.h"
#include "io.h"
#include "conversion.h"
#include "cbc.h"

//#include "main.h"

extern char entree[100];
extern char sortie[100];
extern char key[65];
struct Widgets {
  GtkWidget *p_vte;
  GtkWidget *p_button_open;
  GtkWidget *p_label_open;
  GtkWidget *p_window;
  GtkWidget *p_main_box_vertical;
  GtkWidget *p_main_box_horizontal;
  GtkWidget *p_choose_file_box;
  GtkWidget *p_right_box;
  GtkWidget *p_button ;
  GtkWidget *p_button_encode;
  GtkWidget *p_button_decode;
  GtkWidget *p_label_choix;
  GtkWidget *p_label_cle;
  GtkWidget *p_text;
  GtkWidget *p_button_save;
  GtkWidget *p_label_save;
};


// sortie du programme
void cb_exit(GtkWidget *p_widget, gpointer label) {
  gtk_main_quit(); // fonction de base de gtk qui kill tous les composants

    // ajouter ici tous les autres élements à libérer à la fin


    // var non utilisées
  (void)p_widget;
  (void)label;
}


void cb_encode(GtkWidget *appelant, gpointer *label) {
  struct Widgets *widgets = (struct Widgets*) label;

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

  int taille_cle = (int) gtk_entry_get_text_length(widgets->p_text);
  char *cle = gtk_entry_get_text(widgets->p_text);
  int ok = 0;
  if ((taille_cle ==16) || (taille_cle == 24) || (taille_cle == 32)) {
    // on encode si :
    for (int i =0; i<taille_cle; i++) {
      if ((cle[i] == '0') || (cle[i] == '1') || (cle[i] == '2') || (cle[i] == '3') || (cle[i] == '4') || (cle[i] == '5') || (cle[i] == '6') || (cle[i] == '7') || (cle[i] == '8') || (cle[i] == '9') || (cle[i] == 'a') || (cle[i] == 'b') || (cle[i] == 'c') || (cle[i] == 'd') || (cle[i] == 'e') || (cle[i] == 'f') ) {
          // on encode
          ok = 1;
      } 
    }
  }
  if (ok == 1) {

    //mesure du temps
    time_t debut;
    time_t fin;

    memcpy(key, cle, taille_cle);
    time(&debut);
    chiffrer_cbc();
    time(&fin);
    time_t temps = fin-debut;
    VteTerminal *term = widgets->p_vte;
    vte_terminal_feed(term, "Endodage ...\n\r", 14);

    //taille fichier
    int file_length;
    byte *data = NULL; // on utilise pas ici
    data = lecture(&file_length);

    char text_taille[100] = "";
    //strcpy(text_taille, "Taille : ");
    //sprintf(text_taille, "%d", file_length);
    //text_taille = snprintf(NULL, 0, "%d", file_length);
    //malloc(17+ ceil(log10(file_length)));
    sprintf(text_taille, "Taille encodé :%d\n\r", file_length);
    //strcat(text_taille, "\r");

    char text_temps[100] = "";
    //strcpy(text_taille, "Temps : ");
    sprintf(text_temps, "Temps : %d s\n\r", temps);

    char text_vitesse[100] = "";
    sprintf(text_vitesse, "Vitesse : %d mo/s\n\r", ((file_length / 100000) / temps));

    vte_terminal_feed(term, text_taille, 100);
    vte_terminal_feed(term, text_temps, 100);
    vte_terminal_feed(term, text_vitesse, 100);
  }
  (void) appelant;
}


void cb_decode(GtkWidget *appelant, gpointer *label) {
  struct Widgets *widgets = (struct Widgets*) label;



  int taille_cle = (int) gtk_entry_get_text_length(widgets->p_text);
  char *cle = gtk_entry_get_text(widgets->p_text);
  int ok = 0;
  if ((taille_cle ==16) || (taille_cle == 24) || (taille_cle == 32)) {
    // on encode si :
    for (int i =0; i<taille_cle; i++) {
      if ((cle[i] == '0') || (cle[i] == '1') || (cle[i] == '2') || (cle[i] == '3') || (cle[i] == '4') || (cle[i] == '5') || (cle[i] == '6') || (cle[i] == '7') || (cle[i] == '8') || (cle[i] == '9') || (cle[i] == 'a') || (cle[i] == 'b') || (cle[i] == 'c') || (cle[i] == 'd') || (cle[i] == 'e') || (cle[i] == 'f') ) {
          // on encode
          ok = 1;
      } 
    }
  }
  if (ok == 1) {
    memcpy(key, cle, taille_cle);
    dechiffrer_cbc();
  }
  

  (void) appelant;
}



void cb_ouvertureFichier (GtkWidget *appelant, gpointer *label) {
  struct Widgets *widgets = (struct Widgets*) label;
  GtkWidget *p_dialog = NULL;
  p_dialog = gtk_file_chooser_dialog_new ("files", NULL,
                                          GTK_FILE_CHOOSER_ACTION_OPEN, // mode ouverture de fichier
                                          "Cancel", GTK_RESPONSE_CANCEL, // type du premier bouton, label de sortie si choisi
                                          "Open", GTK_RESPONSE_ACCEPT, // type du second bouton, label de sortie si choisi
                                          NULL); // pas de prochain bouton
  if (gtk_dialog_run (GTK_DIALOG (p_dialog)) == GTK_RESPONSE_ACCEPT) { // si on a cliqué sur ouvrir
    gchar *file_name = NULL; // creer le conteneur qui va prendre le nom du fichier
    file_name = gtk_file_chooser_get_filename (GTK_FILE_CHOOSER (p_dialog)); // recuperer le nom fu fichier de la boite de dialogue
    gtk_label_set_text(GTK_LABEL(widgets->p_label_open), file_name); // mettre a jour le lable du "textview" avec le chemin du fichier
    //char entree[100];
    strcpy((entree), file_name);
    g_free (file_name), file_name = NULL;
  }
  gtk_widget_destroy(p_dialog);
  (void)appelant; // on s'en sert pas
}


void cb_enregistrementFichier (GtkWidget *appelant, gpointer *label) {
  struct Widgets *widgets = (struct Widgets*) label;
  GtkWidget *p_dialog = NULL;
  p_dialog = gtk_file_chooser_dialog_new ("files", NULL,
                                          GTK_FILE_CHOOSER_ACTION_SAVE, // mode ouverture de fichier
                                          "Cancel", GTK_RESPONSE_CANCEL, // type du premier bouton, label de sortie si choisi
                                          "Open", GTK_RESPONSE_ACCEPT, // type du second bouton, label de sortie si choisi
                                          NULL); // pas de prochain bouton
  if (gtk_dialog_run (GTK_DIALOG (p_dialog)) == GTK_RESPONSE_ACCEPT) { // si on a cliqué sur ouvrir
    gchar *file_name = NULL; // creer le conteneur qui va prendre le nom du fichier
    file_name = gtk_file_chooser_get_filename (GTK_FILE_CHOOSER (p_dialog)); // recuperer le nom fu fichier de la boite de dialogue
    gtk_label_set_text(GTK_LABEL(widgets->p_label_save), file_name); // mettre a jour le lable du "textview" avec le chemin du fichier
    //char sortie[100];
    strcpy((sortie), file_name);
    g_free (file_name), file_name = NULL;
  }
  gtk_widget_destroy(p_dialog);
  (void)appelant; // on s'en sert pas
}
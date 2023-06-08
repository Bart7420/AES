
#include <stdlib.h>
#include <gtk/gtk.h>
#include <vte/vte.h>
#include <stdio.h>
#include <time.h>
#include <math.h>
#include <sys/time.h>
#include <unistd.h>


#include "callbacks.h"
#include "io.h"
#include "conversion.h"
#include "cbc.h"
#include "ecb.h"
#include "bmp.h"

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
  GtkWidget *p_left_box;
  GtkWidget *p_right_box;
  GtkWidget *p_button ;
  GtkWidget *p_button_encode;
  GtkWidget *p_button_decode;
  GtkWidget *p_label_choix;
  GtkWidget *p_label_cle;
  GtkWidget *p_text;
  GtkWidget *p_button_save;
  GtkWidget *p_label_save;
  GtkWidget* p_radio_btn_cbc;
  GtkWidget* p_radio_btn_ebc;
  GtkWidget *p_case_bmp;
  GtkWidget *p_radio_btn_aes_128;
  GtkWidget *p_radio_btn_aes_192;
  GtkWidget *p_radio_btn_aes_256;
  GtkWidget *p_case_hexa;
};


// sortie du programme
void cb_exit(GtkWidget *p_widget, gpointer label) {
  struct Widgets *widgets = (struct Widgets*) label;
  //gtk_widget_destroy(widgets->p_window);
  gtk_main_quit(); // fonction de base de gtk qui kill tous les composants

    // ajouter ici tous les autres élements à libérer à la fin


    // var non utilisées
  (void)p_widget;
  (void)label;
}














void sha256(char *cle_utilisateur, int taille_cle, char cle[33]) {
  char input_term[33+100] = ""; // taille max de la clé de 100
  strcpy(input_term, "echo -n ");
  strcat(input_term, cle_utilisateur);
  strcat(input_term, " | openssl sha256 -binary");

  printf("cdm : %s\n", input_term);

  FILE *term;
  char sortie_term[1035] = "";
  //ouverture du terminal

  term = popen(input_term, "r");
  if (term == NULL) {
    printf("Arret. Commande non trouvée\n" );
    exit(1);
  }

  while (fgets(sortie_term, sizeof(sortie_term), term) != NULL) {
    printf("%x", sortie_term);
  }
  fgets(sortie_term, sizeof(sortie_term), term);
  //printf("%x\n", sortie_term);
  puts(sortie_term);

  pclose(term);


  printf("taille de sortie term : %d\n", strlen(sortie_term));
  snprintf(cle, 33, sortie_term);
  //strcpy(cle, sortie_term);
  printf("taille_cle : %d\n", taille_cle);

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
  /*
  // ENCODAGE DU MOT DE PASSE EN CLé AES
  FILE *term;
  char sortie_term[1035] = "";
  //ouverture du terminal
  term = popen("echo -n coucou | openssl sha256 -binary", "r");
  if (term == NULL) {
    printf("Arret. Commande non trouvée\n" );
    exit(1);
  }
  while (fgets(sortie_term, sizeof(path), term) != NULL) {
    printf("%s", sortie_term);
  }
  fgets(sortie_term, sizeof(sortie_term), term);
  pclose(term);
  */

  // gestioon de la clé

  //int taille_cle = (int) gtk_entry_get_text_length(widgets->p_text);
  int taille_cle = 64;
  char *cle_utilisateur = gtk_entry_get_text(widgets->p_text);


/*

  char input_term[33+100] = ""; // taille max de la clé de 100
  strcpy(input_term, "echo -n ");
  strcat(input_term, cle_utilisateur);
  strcat(input_term, " | openssl sha256 -binary");

  printf("cdm : %s\n", input_term);

  FILE *term;
  char sortie_term[1035] = "";
  //ouverture du terminal

  term = popen(input_term, "r");
  if (term == NULL) {
    printf("Arret. Commande non trouvée\n" );
    exit(1);
  }

  while (fgets(sortie_term, sizeof(sortie_term), term) != NULL) {
    printf("%x", sortie_term);
  }
  fgets(sortie_term, sizeof(sortie_term), term);
  //printf("%x\n", sortie_term);
  puts(sortie_term);
  pclose(term);

  char cle[33];
  printf("taille de sortie term : %d\n", strlen(sortie_term));
  snprintf(cle, 33, sortie_term);
  
  //strcpy(cle, sortie_term);
  printf("taille_cle : %d\n", taille_cle);


*/
  char cle[33];
  int ok = 1;



  if (gtk_toggle_button_get_active(GTK_TOGGLE_BUTTON(widgets->p_case_hexa))==TRUE) {
    
    taille_cle = (int) gtk_entry_get_text_length(widgets->p_text);
    if ((taille_cle !=32) && (taille_cle != 48) && (taille_cle != 64)) {
      ok=0;
      printf("la clé n'est pas de la bonne taille\n");
    }
    // on encode si :
    for (int i =0; i<taille_cle; i++) {
      if ((cle_utilisateur[i] != '0') && (cle_utilisateur[i] != '1') && (cle_utilisateur[i] != '2') && (cle_utilisateur[i] != '3') && (cle_utilisateur[i] != '4') && (cle_utilisateur[i] != '5') && (cle_utilisateur[i] != '6') && (cle_utilisateur[i] != '7') && (cle_utilisateur[i] != '8') && (cle_utilisateur[i] != '9') && (cle_utilisateur[i] != 'a') && (cle_utilisateur[i] != 'b') && (cle_utilisateur[i] != 'c') && (cle_utilisateur[i] != 'd') && (cle_utilisateur[i] != 'e') && (cle_utilisateur[i] != 'f') ) {

          ok = 0;
          printf("la clé n'est pas dans le bon format\n");
      } 
    }
    if (ok==1) {
      //for (int i = 0; i < taille_cle; i++) {
      //  cle[i] = transform(cle_utilisateur[i]);
      //}


      strToWords(cle_utilisateur, cle, taille_cle);
    }
    

  } else {
    // mode mot de passe de l'utilisateur
    printf("bbbbbbbbbbbbbbb\n");
    sha256(cle_utilisateur, taille_cle, cle);
    ok=1;
    
  }



  if (ok == 1) {

    //mesure du temps
    struct timeval debut;
    struct timeval fin;
    double tempsAes = 0;
    VteTerminal *term = widgets->p_vte;
    vte_terminal_feed(term, "Endodage ...\n\r", 14);
    sleep(1);
    

    memcpy(key, cle, taille_cle/2);
    printf("taille de la clé :::::::::::: %d\n", taille_cle);
    for (int i = 0; i < 32; i++)
    {
      printf("%x ", cle[i]);
    }
    printf ("\n");
    for (int i = 0; i < 32; i++)
    {
      printf("%x ", key[i]);
    }
    printf ("\n");
    


    printf("taille de la key : %d\n", strlen(key));
    gettimeofday(&debut, 0);
    
    if (gtk_toggle_button_get_active (GTK_TOGGLE_BUTTON(widgets->p_radio_btn_cbc))==TRUE) {
      printf("mode choisi : cbc\n");
      if (gtk_toggle_button_get_active (GTK_TOGGLE_BUTTON(widgets->p_case_bmp))==TRUE) {
        bmp(1, 2, entree, sortie, key);
      } else {
        tempsAes = chiffrer_cbc(entree, sortie, key, taille_cle);
      }
      
    }
    if (gtk_toggle_button_get_active (GTK_TOGGLE_BUTTON(widgets->p_radio_btn_ebc))==TRUE) {
      printf("mode choisi : ecb\n");
      if (gtk_toggle_button_get_active (GTK_TOGGLE_BUTTON(widgets->p_case_bmp))==TRUE) {
        bmp(1, 1, entree, sortie, key);
      } else {
        tempsAes = chiffrer_ecb(entree, sortie, key, taille_cle);
      }
      
    }
    


    gettimeofday(&fin, 0);
    long secondes = fin.tv_sec - debut.tv_sec;
    long microsecondes = fin.tv_usec - debut.tv_usec;
    double temps = secondes + microsecondes*1e-6;
    

    //taille fichier
    long long int file_length;
    byte *data = NULL; // on utilise pas ici
    data = lecture(entree, &file_length, 0);
    free(data);

    char text_taille[100] = "";
    sprintf(text_taille, "Taille encodé :%lld\n\r", file_length);

    char text_temps[100] = "";
    sprintf(text_temps, "Temps total : %.3f s\n\r", temps);

    char text_vitesse[100] = "";
    if (temps == 0) { temps++;}
    sprintf(text_vitesse, "Vitesse totale : %.3f mo/s\n\r", ((file_length / 1e6) / temps));

    char text_temps2[100] = "";
    sprintf(text_temps2, "Temps AES : %.3f s\n\r", tempsAes);

    char text_vitesse2[100] = "";
    if (tempsAes == 0) { tempsAes++;}
    sprintf(text_vitesse2, "Vitesse AES : %.3f mo/s\n\r", ((file_length / 1e6) / tempsAes));

    vte_terminal_feed(term, text_taille, 100);
    vte_terminal_feed(term, text_temps, 100);
    vte_terminal_feed(term, text_vitesse, 100);
    vte_terminal_feed(term, text_temps2, 100);
    vte_terminal_feed(term, text_vitesse2, 100);

  }
  (void) appelant;
}


void cb_decode(GtkWidget *appelant, gpointer *label) {
  struct Widgets *widgets = (struct Widgets*) label;


  int ok = 1;
  int taille_cle = 64;
  char *cle_utilisateur = gtk_entry_get_text(widgets->p_text);
  char cle[65] = "";
  if (gtk_toggle_button_get_active(GTK_TOGGLE_BUTTON(widgets->p_case_hexa))==TRUE) {
    
    taille_cle = (int) gtk_entry_get_text_length(widgets->p_text);
    if ((taille_cle !=32) && (taille_cle != 48) && (taille_cle != 64)) {
      ok=0;
      printf("la clé n'est pas de la bonne taille\n");
    }
    // on encode si :
    for (int i =0; i<taille_cle; i++) {
      if ((cle_utilisateur[i] != '0') && (cle_utilisateur[i] != '1') && (cle_utilisateur[i] != '2') && (cle_utilisateur[i] != '3') && (cle_utilisateur[i] != '4') && (cle_utilisateur[i] != '5') && (cle_utilisateur[i] != '6') && (cle_utilisateur[i] != '7') && (cle_utilisateur[i] != '8') && (cle_utilisateur[i] != '9') && (cle_utilisateur[i] != 'a') && (cle_utilisateur[i] != 'b') && (cle_utilisateur[i] != 'c') && (cle_utilisateur[i] != 'd') && (cle_utilisateur[i] != 'e') && (cle_utilisateur[i] != 'f') ) {

          ok = 0;
          printf("la clé n'est pas dans le bon format\n");
      } 
    }
    if (ok==1) {
      //for (int i = 0; i < taille_cle; i++) {
        //cle[i] = transform(cle_utilisateur[i]);
      //  printf("%x", cle[i]);
      //}
      strToWords(cle_utilisateur, cle, taille_cle);
    }
    

  } else {
    // mode mot de passe de l'utilisateur
    printf("bbbbbbbbbbbbbbb\n");
    sha256(cle_utilisateur, taille_cle, cle);
    ok=1;
  }

  

  //int taille_cle = (int) gtk_entry_get_text_length(widgets->p_text);
  
  
  
  
  
  
  
  if (ok == 1) {


    //mesure du temps
    struct timeval debut;
    struct timeval fin;
    double tempsAes = 0;

    VteTerminal *term = widgets->p_vte;
    vte_terminal_feed(term, "Decodage ...\n\r", 14);

    memcpy(key, cle, taille_cle/2);
    printf("taille de la taille_cle : %d\n", taille_cle);
    printf("taille de la key : %d\n", strlen(key));
    printf("taille de la cle : %d\n", strlen(cle));
    for (int i = 0; i < taille_cle; i++) {
        printf("%x ", cle[i]);
      }
    gettimeofday(&debut, 0);

    if (gtk_toggle_button_get_active (GTK_TOGGLE_BUTTON(widgets->p_radio_btn_cbc))==TRUE) {
      printf("mode choisi : cbc\n");
      if (gtk_toggle_button_get_active (GTK_TOGGLE_BUTTON(widgets->p_case_bmp))==TRUE) {
        
        bmp(2, 2, entree, sortie, key);
      } else {
        tempsAes = dechiffrer_cbc(entree, sortie, key, taille_cle);
      }
    }
    if (gtk_toggle_button_get_active (GTK_TOGGLE_BUTTON(widgets->p_radio_btn_ebc))==TRUE) {
      printf("mode choisi : ecb\n");
      if (gtk_toggle_button_get_active (GTK_TOGGLE_BUTTON(widgets->p_case_bmp))==TRUE) {
        bmp(2, 1, entree, sortie, key);
      } else {
        tempsAes = dechiffrer_ecb(entree, sortie, key, taille_cle);
      }
    }
    gettimeofday(&fin, 0);
    long secondes = fin.tv_sec - debut.tv_sec;
    long microsecondes = fin.tv_usec - debut.tv_usec;
    double temps = secondes + microsecondes*1e-6;
  

    //taille fichier
    long long int file_length;
    byte *data = NULL; // on utilise pas ici
    data = lecture(entree, &file_length, 0);

    char text_taille[100] = "";
    sprintf(text_taille, "Taille décodé :%lld\n\r", file_length);

    char text_temps[100] = "";
    sprintf(text_temps, "Temps total : %.3f s\n\r", temps);

    char text_vitesse[100] = "";
    if(temps == 0) {temps++;}
    sprintf(text_vitesse, "Vitesse totale : %.3f mo/s\n\r", ((file_length / 1000000) / temps));

    char text_temps2[100] = "";
    sprintf(text_temps2, "Temps AES : %.3f s\n\r", tempsAes);

    char text_vitesse2[100] = "";
    if(tempsAes == 0) {tempsAes++;}
    sprintf(text_vitesse2, "Vitesse AES : %.3f mo/s\n\r", ((file_length / 1000000) / tempsAes));

    vte_terminal_feed(term, text_taille, 100);
    vte_terminal_feed(term, text_temps, 100);
    vte_terminal_feed(term, text_vitesse, 100);
    vte_terminal_feed(term, text_temps2, 100);
    vte_terminal_feed(term, text_vitesse2, 100);

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
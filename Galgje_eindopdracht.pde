String geheimWoord = "walvishaai";
String geradenWoord = "";
int verkeerdePogingen = 0;
int MaxVerkeerdepogingen = 8;
boolean GameOver = false;

void setup() {
  size(500, 500);
  textSize(25);
  fill(#F7DCF1);
  background(#A5A3A4);
  for (int i = 0; i < geheimWoord.length(); i++) {
    geradenWoord += "_";
  }
}

void draw() {
  background(#F20FCD);
  fill(0);
  text("Raad het woord: " + geradenWoord, 20, 60);
  text("Verkeerde Pogingen: " + verkeerdePogingen, 20, 100);

  if (GameOver) {
    fill(#A1D4FC);
    text("Game Over!", width / 2 - 100, height / 2);
    noLoop(); // stopt draw()
    return;
  }

  if (geradenWoord.equals(geheimWoord)) {
    fill(#A1D4FC);
    text("Gefeliciteerd! Je hebt het woord geraden!", 20, 150);
    noLoop(); // stopt draw()
  }
}

void keyPressed() {
  if (GameOver || geradenWoord.equals(geheimWoord)) {
    return; // doe niks als het spel voorbij is
  }

  char ingevoerdeLetter = key;
  ingevoerdeLetter = Character.toLowerCase(ingevoerdeLetter);

  boolean gevonden = false;

  for (int i = 0; i < geheimWoord.length(); i++) {
    if (geheimWoord.charAt(i) == ingevoerdeLetter) {
      geradenWoord = geradenWoord.substring(0, i) + ingevoerdeLetter + geradenWoord.substring(i + 1);
      gevonden = true;
    }
  }

  if (!gevonden) {
    verkeerdePogingen++;
    if (verkeerdePogingen >= MaxVerkeerdepogingen) {
      GameOver = true;
    }
  }
}

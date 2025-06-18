int antwoord = 0;
int getalEen = 0;
int getalTwee = 1;

println(0);
println(1);

for(int i = 0; i < 10; i++){
  antwoord = getalEen + getalTwee;
  println(getalEen + "+" + getalTwee + "=" + antwoord);
  getalEen = getalTwee;
  getalTwee = antwoord;
  
}

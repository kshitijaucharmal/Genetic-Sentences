class Word{
  char[] genes = new char[target.length()];
  int fitness = 0;
  
  Word(){
    for(int i = 0; i < target.length(); i++){
      genes[i] = char(int(random(32, 129)));
    }
  }
  
  String returnWord(){
    //println(new String(genes));
    return new String(genes);
  }
  
  void calc_fitness(){
    for(int i = 0; i < target.length(); i++){
      if(genes[i] == (target.charAt(i))){
        fitness ++;
      }
    }
  }
  
  void mutate(float m_rate){
    for(int i = 0; i < genes.length; i++){
      if(random(1) < m_rate){
        genes[i] = char(int(random(32, 129)));
      }
    }
  }
  
  Word crossover(Word partner){
    Word child = new Word();
    for(int i = 0; i < genes.length; i++){
      float r = random(1);
      if(r < 0.5){
        child.genes[i] = partner.genes[i];
      }
      else{
        child.genes[i] = this.genes[i];
      }
    }
    return child;
  }
}

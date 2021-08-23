
String target = "You can't see me!";
int popSize = 1000;
float mutation_rate = 0.01f;
int generation = 1;
boolean done = false;

Word[] population = new Word[popSize];

void setup() {
  size(600, 600);
  for (int i = 0; i < popSize; i++) {
    population[i] = new Word();
  }
}

void draw() {
  background(255);
  for (int i = 0; i < popSize; i++) {
    population[i].calc_fitness();
  }

  for (int i = 0; i < popSize; i++) {
    for (int j = i+1; j < popSize; j++) {
      if (population[i].fitness < population[j].fitness) {
        Word temp = population[i];
        population[i] = population[j];
        population[j] = temp;
      }
    }
  }

  showBest(population[0]);
  if(population[0].fitness >= target.length()){
    println("Finished at generation " + generation + " word : " + population[0].returnWord());
    exit();
  }

  for (int i = 0; i < popSize; i++) {
    Word parent1 = population[int(random(popSize/10))];
    Word parent2 = population[int(random(popSize/10))];
    Word child = parent1.crossover(parent2);
    child.mutate(mutation_rate);
    population[i] = child;
  }
  generation++;
}

void showBest(Word w) {
  textSize(40);
  fill(0);
  textAlign(CENTER, CENTER);
  text(w.returnWord(), width/2, height/2);
  text("Generation : " + generation, width/2, 100);
  //generation ++;
}

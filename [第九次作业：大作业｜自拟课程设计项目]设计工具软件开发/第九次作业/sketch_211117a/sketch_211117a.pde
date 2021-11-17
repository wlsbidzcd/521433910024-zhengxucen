
int grid = 20;
int background_color = 255;
int snake_length = 2;
int snake_length_max = 500;

int snake_head_x = 0;
int snake_head_y = 0;


int[] x = new int[snake_length_max];//gong 500 ge de shuzu?
int[] y = new int[snake_length_max];


int food_x;
int food_y;


char snake_direction = 'R';
char snake_direction_temp;

int speed = 5;


int time_start;
int time_passed;
int time_interval;


int best_score = snake_length - 2;


boolean food_eaten = true;


boolean game_over = false;
boolean game_start = false;


int game_pause = 0;


void setup()
{
  size(600, 600);
  //frameRate(10);
  noStroke();
  show_first_start();

  time_start = millis();
}

void draw()
{
  if (keyPressed && (key == 'r' || key == 'R'))
  {
    if (game_start == false)
    {
      game_start = true;
    }
    if (game_over)
    {
      snake_init();//?
    }
  }

  if (game_over)
  {
    return;//zhong duan time yuju
  }

  time_passed = millis() - time_start; 
  time_interval = 1000 / speed; //?


  if (time_passed > time_interval && snake_direction != 'P' && game_start)
  {
    background(background_color);

   
    switch(snake_direction) {
    case 'L':
      snake_head_x -= grid;
      break;
    case 'R':
      snake_head_x += grid;
      break;
    case 'D':
      snake_head_y += grid;
      break;
    case 'U':
      snake_head_y -= grid;
      break;
    }

   
    draw_food(width, height);


    if (snake_head_x == food_x && snake_head_y == food_y)
    {
      food_eaten = true; 
      snake_length++;

      if ( snake_length%5 == 1) {
        speed++;
      }
      speed = min(20, speed);
    }

   
    draw_snake();

   
    if (check_snake_die())
    {
      return;
    }

    time_start = millis(); 
  }
}

void keyPressed()
{
  if (key == 'p' || key == 'P')
  {
    game_pause++;
    if (game_pause%2 == 1)
    {
      snake_direction_temp = snake_direction;
      snake_direction = 'P';
    } else {
      snake_direction = snake_direction_temp;
    }
  }

  if (snake_direction != 'P'&& keyPressed && key == CODED)
  {
    switch(keyCode) {
    case LEFT:
      if (snake_direction != 'R') {
        snake_direction = 'L';
      }
      break;
    case RIGHT:
      if (snake_direction != 'L') {
        snake_direction = 'R';
      }
      break;
    case DOWN:
      if (snake_direction != 'U') {
        snake_direction = 'D';
      }
      break;
    case UP:
      if (snake_direction != 'D') {
        snake_direction = 'U';
      }
      break;
    }
  }
}

void draw_food(int max_width, int max_high)
{
  int food_out = 0; 

  
  fill(#F71E1E); 

  
  if (food_eaten)
  {
    while (food_out == 0)
    {
      food_out = 1;
      food_x = int(random(0, max_width) / grid) * grid;
      food_y = int(random(0, max_high) / grid) * grid;

      for (int i=snake_length-1; i>=0; i--) {
        if ( food_x == x[i] && food_y == y[i] ) {
          food_out = 0;
        }
      }
    }
  }

  rect(food_x, food_y, grid, grid);
  food_eaten = false;
}

void draw_snake()
{
 
  for (int i=snake_length-1; i>0; i--) {
    x[i] = x[i-1];
    y[i] = y[i-1];
  }


  x[0] = snake_head_x;
  y[0] = snake_head_y;


  fill(#3874F6);


  for (int i=0; i<snake_length; i++) {
    rect(x[i], y[i], grid, grid);
  }
}

void show_first_start()
{
  pushMatrix();
  background(0);  
  translate(width/2, height/2 - 50);
  fill(255);  
  textAlign(CENTER); 
  textSize(96);
  text("Snake", 0, 0);

  fill(120);
  textSize(40);
  text("Press 'R' or 'r' to start.", 0, 260);
  popMatrix();
}

void show_game_over()
{
  game_over = true;

  pushMatrix();
  best_score = best_score > snake_length ? (best_score - 2 ): (snake_length - 2);

  background(0);  
  translate(width/2, height/2 - 50);
  fill(255);  
  textAlign(CENTER); 
  textSize(84);
  text(snake_length - 2 + "/" + best_score, 0, 0);

  fill(120);
  textSize(30);
  text("Score / Best", 0, 200);
  text("Game Over, Press 'R' or 'r' to restart.", 0, 260);
  popMatrix();
}

void snake_init()
{
  background(background_color);
  snake_length = 2;
  game_over = false;
  snake_head_x = 0;
  snake_head_y = 0;
  snake_direction = 'R';
  speed = 5;
}

boolean check_snake_die()
{
  
  if ( snake_head_x < 0 || snake_head_x >= width || snake_head_y < 0 || snake_head_y >= height) {
    show_game_over();
    return true;
  }


  if ( snake_length > 2 ) {
    for ( int i=1; i<snake_length; i++ ) {
      if ( snake_head_x == x[i] && snake_head_y == y[i] ) {
        show_game_over();
        return true;
      }
    }
  }

  return false;
}

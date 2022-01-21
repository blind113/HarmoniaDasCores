///////////////////////////////////////////////////////////////////////////////
//
//    Trabalho sobre Harmonia de cores.
//  Projeto para a materia de Design de Interação 2010 - 2°semetre
//  Realizado pela Equipe nº 01
//  Alunos : ALfredo E. Osorio
//           Murilo S. Alves 
//           Felipe L. Zem
//  Profesores: Dr. Luiz Ernesto Merkle
//              Dra. Marília A. Amaral
//  Participação: M.SC.Marta Proença "Siellepaz" - Tradução Simultânea de Português para Lingua Brasileira de Sinais
//                Dra. Luciana Martha Silveira (DADIN) - Projetos envolvendo Objetos de Ensino e Aprendizagem sobre Cor
//                Gabrielle Hartmann Grimm (Mestranda no PPGTE) - Estágio Docência com a Prof Luciana
//  Mododelo de cor RGB
//
///////////////////////////////////////////////////////////////////////////////

import controlP5.*;                                     // importe da biblioteca, para a criação de botoes
PFont font, t;

ControlP5 controlP5;
ControlFont dfont;
int totalCores = 12;
int segmentos = 1;                                      // Segmentos de cores para cada setor circular.
float ajusteRotacional = TWO_PI / totalCores / 2;       // Ajusta a posição das cores.
float raio_do_circulo;
float largura_dos_segmentos;
float intervalo_de_segmentos = TWO_PI / totalCores;     // Para 12 cores, tem-se 30º.
String s;
int cUsuario = 255;                                     // Variavel que recebe o valor da cor que o Usuario escolheu
int cAnaloga1 = 255, cAnaloga2 = 255;                   // Variavei que recebem o calculo atravez da matriz e dos condicionais, para pintar os rectagulos dependendo da cor e da Harmonia Analoga
int cTriadica1 = 255, cTriadica2 = 255;                 // Variavei que recebem o calculo atravez da matriz e dos condicionais, para pintar os rectagulos dependendo da cor e da Harmonia Triadica
int cC = 255;                                           // Variavel que recebem o calculo atravez da matriz e dos condicionais, para pintar os rectagulos dependendo da cor e da Harmonia Complementar
int cComplementarD1 = 255, cComplementarD2 =255;        // Variavel que recebem o calculo atravez da matriz e dos condicionais, para pintar os rectagulos dependendo da cor e da Harmonia Complementar Dividida
int cDupla1 = 255, cDupla2 = 255, cDupla3 = 255;        // Variavel que recebem o calculo atravez da matriz e dos condicionais, para pintar os retangulos dependendo da cor e da Harmonia Complementar Dupla
int cQuadra1 = 255, cQuadra2= 255, cQuadra3 = 255;      // Variavel que recebem o calculo atravez da matria e dos condicionais, para pintar os retangulos dependendo da cor e da Harmonia Quadratica
boolean harm1, harm2, harm3, harm4, harm5,harm6;

void setup()
{
  // background(205);
  size(800, 600);
  controlP5 = new ControlP5(this);
  PFont pfont = createFont("Times", 10, true);            //Controla A fonte dos Botoes
  dfont = new ControlFont(pfont);
  controlP5.setControlFont(dfont);
  // Botoes para a mudaça do layout, para cada harmonia
  controlP5.addButton("Complementar", 0, 50, 295, 175, 25);
  controlP5.addButton("Analoga", 0, 50, 345, 175, 25);
  controlP5.addButton("Triadica", 0, 50, 395, 175, 25);
  controlP5.addButton("Dividida", 0, 50, 445, 175, 25);
  controlP5.addButton("Dupla", 0, 50, 495, 175, 25);
  controlP5.addButton("Quadratica", 0, 50, 545, 175,25);
  // controlP5.addButton("harmonia7", 0, 100, 350 , 100, 25);
  // Podem ser adicionados mais botoes, com harmonias novas ou informaçoes especificas dependendo da necesidades do usuario
  // s = "certo";
}

  // metodo para controlar os eventos do mouse e click dos botoes 
public void controlEvent(ControlEvent e)
{
  //println(e.name());                                    // teste dos botoes
}

  // Cada botao reconehce que esta sendo Clicado e seta o layout que vai aparecer na tela 
public void Analoga()                                  // metodo para cara botao separado, pois cada harmonia tem um layout diferente
{
  harm1 = true;
  harm2 = false;
  harm3 = false;
  harm4 = false;
  harm5 = false;
  harm6 = false;
}
public void Complementar()
{  
  harm2 = true;
  harm1 = false;
  harm3 = false;
  harm4 = false;
  harm5 = false;
  harm6 = false;
}
public void Triadica()
{
  harm1 = false;
  harm2 = false;
  harm3 = true;
  harm4 = false;
  harm5 = false;
  harm6 = false;
}
public void Dividida()
{
  harm1 = false;
  harm2 = false;
  harm3 = false;
  harm4 = true;
  harm5 = false;
  harm6 = false;
}
public void Dupla()
{
  harm1 = false;
  harm2 = false;
  harm3 = false;
  harm4 = false;
  harm5 = true;
  harm6 = false;
}
public void Quadratica()
{
  harm1 = false;
  harm2 = false;
  harm3 = false;
  harm4 = false;
  harm5 = false;
  harm6 = true;
}

 // podem ser Adicionados mais Botoes, com metodos difentes.
public void drawCirculoDeCores() 
{
 // Cria um arco em torno do círculo de cores para delimitá-lo.
  fill(0);
  arc(150, 150, (raio_do_circulo/2)+10, (raio_do_circulo/2)+10, 0, TWO_PI);
  noFill();
  
  for (int i = 0; i < segmentos; i++) {
    /* Cria um array de cores que vai ganhando os elementos necessários para criar
     * o círculo de cores, com todos os segmentos necessários para cada cor.
     */

    int[] cores = {
      //color(RED, GREEN, BLUE)
      //(255/segmentos)*i = cada segmento interno é a mesma cor. Porém, escurecida.
      //((255/VALOR)/segmentos)*i = usa-se para transições entre cores.
      color(360-(360/segmentos)*i, 0, (360/2)-((360/2)/segmentos)*i),                        //ESCALA RED-PURPLE
      color(360-(360/segmentos)*i, 0, 360-(360/segmentos)*i),                                //ESCALA PURPLE
      color((255/2)-((255/2)/segmentos)*i, 0, 255-(255/segmentos)*i),                        //ESCALA PURPLE-BLUE
      color(0, 0, 255-(255/segmentos)*i),                                                    //ESCALA BLUE 
      color(0, (255)-((255)/segmentos)*i, (255/2)-((255/2)/segmentos)*i),                    //ESCALA BLUE-GREEN
      color(0, 255-(255/segmentos)*i, 0),                                                    //ESCALA GREEN
      color((255/2)-((255/2)/segmentos)*i, 255-(255/segmentos)*i, 0),                        //ESCALA GREEN-YELLOW
      color(255-(255/segmentos)*i, 255-(255/segmentos)*i, 0),                                //ESCALA YELLOW
      color(255-(255/segmentos)*i, ((int) (255/1.5))-(((int) (255/1.5))/segmentos)*i, 0),    //ESCALA YELLOW-ORANGE
      color(255-(255/segmentos)*i, (255/2)-((255/2)/segmentos)*i, 0),                        //ESCALA ORANGE
      color(255-(255/segmentos)*i, ((int) (255/2.5))-(((int) (255/2.5))/segmentos)*i, 0),    //ESCALA ORANGE-RED
      color(255-(255/segmentos)*i, 0, 0)                                                     //ESCALA RED
    };

    for (int j = 0; j < totalCores; j++) 
    {
      /* Pega cada cor armazenada no array de cores e aplica elas dentro do círculo.
         Para os segmentos internos */
      fill(cores[j]);
      //arc(centroX, centroY, LARGURA, ALTURA, começo, fim)
      ellipseMode(CENTER);
      arc(150, 150,                                     //Coloca o círculo na janela.
      raio_do_circulo, raio_do_circulo,                 //Círculo, raio constante.
      intervalo_de_segmentos*j+ajusteRotacional,        //Começo do arco atual.
      intervalo_de_segmentos*(j+1)+ajusteRotacional);   //Fim do arco atual.
    }
    //Diminui o raio conforme há a necessidade de desenhar os segmentos internos.
    raio_do_circulo -= largura_dos_segmentos;
  }
}   
public void mousePressed()
{
  //Redefine-se aqui as caixas das cores harmônicas para que elas zerem antes de ser escolhida uma nova cor.
  cUsuario = 255;
  cAnaloga1 = 255; cAnaloga2 = 255;
  cTriadica1 = 255; cTriadica2 = 255;
  cC=255;
  cComplementarD1 = 255; cComplementarD2 =255;
  cDupla1 = 255; cDupla2 = 255; cDupla3 = 255;
  cQuadra1 = 255; cQuadra2 = 255; cQuadra3 = 255;
  
  cUsuario = get(mouseX, mouseY); // Obtem a cor no mouse (clique e posição).
  int [] segV = new int[12];
  // println(cUsuario);
  // Valores de cada segmento armazenados num array
  segV[0] = -8388864;
  segV[1] = -256; //Amarelo
  segV[2] = -22016;
  segV[3] = -33024;
  segV[4] = -39424;
  segV[5] = -65536; // Vermelho
  segV[6] = -65356;
  segV[7] = -65281;
  segV[8] = -8453889;
  segV[9] = -16776961; //Azul
  segV[10] = -16711809;
  segV[11] = -16711936;
  // Depois da cada click do mouse é calculado todas as harmonias dentro deste metodo.

  for(int i = 0; i<12; i++)
  {
    // Laço para executar as condiçoes de cada harmonia.
    if (segV[i]==cUsuario)
    {  
      /////////////////////////////////////////
      //  Condicionais para Harmonia Analoga //
      /////////////////////////////////////////
      if(i == 11)
      {
        cAnaloga1 = segV[0]; 
        cAnaloga2 = segV[10];
      }
      if (i == 0)
      {
        cAnaloga1 = segV[1];
        cAnaloga2 = segV[11];
      }

      if(i>0 && i<11)
      {
        cAnaloga1 = segV[i+1];
        cAnaloga2 = segV[i-1];
      }
      ///////////////////////////////////////////////
      // Condicionais para a Harmonia Complementar //
      ///////////////////////////////////////////////
      if(i<6)
      {
        cC = segV[i+6];
        //println("teste");
      } 
      if ( i >= 6)
      {
        cC = segV[i-6];
        //println("teste");
      }

      ///////////////////////////////////////////
      // Condicionais Para a Harmonia Triadica //
      ///////////////////////////////////////////
      if (i >= 8)
      {
        if(i==8)
        {
          cTriadica1 = segV[0];
          cTriadica2 = segV[4];
        }
        if(i==9)
        {
          cTriadica1 = segV[1];
          cTriadica2 = segV[5];
        }
        if(i==10)
        {
          cTriadica1 = segV[2];
          cTriadica2 = segV[6];
        }
        if(i==11)
        {
          cTriadica1 =  segV[3];
          cTriadica2 = segV[7];
        }
      }
      if(i<=4)
      {
        if(i==0)
        {
          cTriadica2 = segV[8];
          cTriadica1 = segV[4];
        }
        if(i==1)
        {
          cTriadica2 = segV[9];
          cTriadica1 = segV[5];
        }
        if(i==2)
        {
          cTriadica2 = segV[10];
          cTriadica1 = segV[6];
        }
        if(i==3)
        {
          cTriadica2 = segV[11];
          cTriadica1 = segV[7];
        }
        if(i==4)
        {
          cTriadica2 = segV[0];
          cTriadica1 = segV[8];
        }
        
      }
      if(i>4&& i<8)
      {
        cTriadica1 = segV[i+4];
        cTriadica2 = segV[i-4];
        
        if(i==6)
        {
          cTriadica1 =segV[i+4];
          cTriadica2 = segV[i-4];
        }
      }  
     
      ////////////////////////////////////////////////////////
      // Condicionais para a Harmonia Complementar Dividida // 
      ////////////////////////////////////////////////////////
      if (i>=7)
      {
        if(i==7)
        {
          cComplementarD1 = segV[0];
          cComplementarD2 = segV[2];
        }
        if(i==8)
        {
          cComplementarD1 = segV[1];
          cComplementarD2 = segV[3];
        }
        if(i==9)
        {
          cComplementarD1 = segV[2];
          cComplementarD2 = segV[4];
        }
        if(i==10)
        {
          cComplementarD1 = segV[3];
          cComplementarD2 = segV[5];
        }
        if(i==11)
        {
          cComplementarD1 = segV[4];
          cComplementarD2 = segV[6];
        }
      } 
      if(i <= 6)
      {  
        if (i==6)
        {
          cComplementarD1 = segV[1];
          cComplementarD2 = segV[0];
        }   
        if(i==5)
        {
          cComplementarD1 = segV[0];
          cComplementarD2 = segV[10];
        }
        if(i==4)
        { 
          cComplementarD1 = segV[11];
          cComplementarD2 = segV[9];
        }
        if(i==3)
        {
          cComplementarD1 = segV[10];
          cComplementarD2 = segV[8];
        }
        if(i==2)
        {
          cComplementarD1 = segV[9];
          cComplementarD2 = segV[7];
        }
        if(i==1)
        {
          cComplementarD1 = segV[8];
          cComplementarD2 = segV[6];
        }
        if(i==0)
        {
          cComplementarD1 = segV[7];
          cComplementarD2 = segV[5];
        }
      } 
      /////////////////////////////////////////////////
      // Condicionais para Harmonia Complentar Dupla //
      /////////////////////////////////////////////////  
      
      if(i<6)
      {
        cDupla1 = segV[i+6];
        //println("teste");
      } 
      if ( i >=6)
      {
        cDupla1 = segV[i-6];
        //println("teste");
      }
      if( i == 7)
      {
        cDupla1 = segV[1];
      }
      if(i<10)
      {
        cDupla2 = segV[i+2];
      
      }
      if(i>=10)
      {
        if(i==10)
        {
          cDupla2 = segV[0];
        }
        if(i==11)
        {
          cDupla2 = segV[1];
        }
      }
      if(i>=0 && i <=3)
      {
        cDupla3 = segV[i+8];
      }
      if(i>=4 && i<=11)
      {
        cDupla3 = segV[i-4];
      }
      /////////////////////////////////////////
      // Condicionas para Harmonia Quadrica //
      ///////////////////////////////////////
      if(i>=0 && i<=8)
      {
        cQuadra1 = segV[i+3];
      }
      if(i>=9 && i<=11)
      {
        cQuadra1 = segV[i-9];
      }
      if(i<6)
      {
        cQuadra2 = segV[i+6];
      } 
      if ( i >=6)
      {
        cQuadra2 = segV[i-6];
      }
      if(i>=0 &&i<=2)
      {
        cQuadra3 = segV[i+9];
      }
      if(i>=4 && i<=11)
      {
        cQuadra3 = segV[i-3];
      }
    }// Fim do "laço / if" que diz qual a cor que o usuario escolheu
  }
}

  void draw()
  {
    
      PImage bg;
      // Images must be in the "data" directory to load correctly
      bg = loadImage("chuvacor2.jpg");
      image(bg, 0, 0);
      
      smooth();                                             //Arredonda 'coisas não redondas'.
      ellipseMode(RADIUS);
      noStroke();
      raio_do_circulo =  200;//(float) (min(width, height) * 0.45);
      largura_dos_segmentos = raio_do_circulo / segmentos;
      //Chama o método que desenha o círculo de cores.
      drawCirculoDeCores();
    
      //Sets basicos
      t = loadFont("Century-20.vlw");
      font = loadFont("Andalus-16.vlw");
      fill(255);
      stroke(0);
      textFont(font);
    
    //TELA DE APRESENTAÇÃO
    if ((harm1 == false)&&(harm2 == false)&&(harm3 == false)&&(harm4 == false)&&(harm5 == false)){
      String textoInicial;
      textoInicial = "De acordo com Johannes Itten, a harmonia das cores deve estar relacionada com o equilíbrio e a simetria de porções."
      + " De maneira técnica, por harmonia cromática denomina-se o resultado do equilíbrio entre"
      + " a cor dominante (aparece em maior extensão), a cor tônica (coloração vibrante que traz o constraste) e a cor intermediária (localiza-se entre a cor dominante e a cor tônica)."
      + " Este conjunto de técnicas que se aplica à um espaço para conseguir tal equilíbrio na interacção das cores que o compõem visa portanto buscar um conforto visual no espectador.";
      s = textoInicial;
      textFont(font); 
      fill(255);
      text(s, 270, 425, 500, 175);
      
      String titulo;
      titulo = " Harmonia Cromática ";      
      s = titulo;
      textFont(t); 
      fill(255);
      text(s, 400, 325, 500, 175);
    }
    
    //////////////////////////////////////////////////////////////////////////////
    // Metodos para pintar os layouts de cada HARMONIA
    // e podem ser adicionados novos layouts atraves de novo botoes 
    // pinta background a cada click do botao
    // sendo assim tem de ser repintado todos os demais componentes que estao
    // pintados em cada layout
    //////////////////////////////////////////////////////////////////////////////
    
    //HARMONIA ANALOGA
    if(harm1 == true)
    {
      background(205);
      smooth();       
      ellipseMode(RADIUS);  
      noStroke();
      raio_do_circulo =  200;
      largura_dos_segmentos = raio_do_circulo / segmentos;
      drawCirculoDeCores();
      String harmAna;
      harmAna = "Consiste em uma cor dominante somada às suas duas vizinhas na roda das cores, de modo a enriquecer àquela. Não oferece um contraste vibrante em comparação às harmonias já citadas, porém é bem simples de criá-las.";
      s = harmAna; 
      textFont(font); 
      fill(0);
      text(s, 270, 460, 500,90); 
      fill(cAnaloga1);                          // Aqui é onde vai ser preenchido pelas cores da harmonia em relação ao que o usuario vai escolher
      stroke(0);
      rect(325,300,150,150);
      fill(cAnaloga2);
      stroke(0);
      rect(525,300, 150,150); 
      fill(0);
      text ("Cor Usuário: ", 300, 100, 500, 50);
      fill(0);
      text("Cores Harmonicas: ", 300, 270, 500, 50);
      textFont(t);
      fill(255,0,0);
      text("Harmonia Análoga", 300, 25,500, 50);
      fill(cUsuario);
      stroke(0);
      rect(425,75, 150, 150);
      redraw();
    }
    //HARMONIA COMPLEMENTAR
    if (harm2 == true)
    {
      background(205);
      smooth();         
      ellipseMode(RADIUS);
      noStroke(); 
      raio_do_circulo =  200;
      largura_dos_segmentos = raio_do_circulo / segmentos;
      drawCirculoDeCores(); 
      String harmCom;
      harmCom = "Nesta combinação, usa-se uma cor e sua cor exatamente oposta – no caso do círculo cromático, à 180º da cor escolhida, ou seja, são simétricas com relação ao centro do círculo."
      + " Tem-se melhor efeito quando aplicada entre uma cor quente e sua complementar fria. Esta harmonia gera um grande contraste,"
      + " tendo uma importante aplicabilidade quando deseja-se atrair atenção para determinado objeto, por exemplo.";
      s = harmCom;
      textFont(font); 
      fill(0);
      text(s, 270, 460, 500, 150);
      fill(cC);
      stroke(0);
      rect(425,300,150,150);
      fill(0);
      text ("Cor Usuário: ", 300, 100, 500, 50);
      fill(0);
      text("Cor Harmonica: ", 300, 270, 500, 50);
      textFont(t);
      fill(255,0,0);
      text("Harmonia Complementar", 300, 25,500, 50);
      fill(cUsuario);
      stroke(0);
      rect(425,75, 150, 150);
      redraw();
    }
    //HARMONIA TRIADICA
    if(harm3 == true)
    {
      background(205);
      smooth();         
      ellipseMode(RADIUS);
      noStroke();
      raio_do_circulo =  200;
      largura_dos_segmentos = raio_do_circulo / segmentos;
      drawCirculoDeCores();
      String harmTri;
      harmTri = "São utilizadas três cores, fazendo entre elas um ângulo de 120º, ou seja, equidistantes entre si. Uma boa opção que mantém bom nível de contraste, equilibrando também o balanço e riqueza das cores.";
      s = harmTri;
      textFont(font); 
      fill(0);
      text(s, 270, 460, 500, 150);
      noFill();
      fill(cTriadica1);
      stroke(0);
      rect(325,300,150,150);
      fill(cTriadica2);
      stroke(0);
      rect(525,300, 150,150);
      fill(0);
      text ("Cor Usuário: ", 300, 100, 500, 50);
      fill(0);
      text("Cores Harmonicas: ", 300, 270, 500, 50);
      textFont(t);
      fill(255,0,0);
      text("Harmonia Triádica", 300, 25,500, 50);
      fill(cUsuario);
      stroke(0);
      rect(425,75, 150, 150);
      redraw();
    }
    //COMPLEMENTAR DIVIDIDO
    if(harm4 == true)
    {
      background(205);
      smooth();         
      ellipseMode(RADIUS);
      noStroke();
      raio_do_circulo =  200; 
      largura_dos_segmentos = raio_do_circulo / segmentos;
      drawCirculoDeCores();
      String harmComD;
      harmComD = "Esta utiliza-se das duas vizinhas (logo à direita e à esquerda) da complementar direta da cor escolhida."
      + " Se traçarmos o caminho desta combinação, verifica-se-á uma formação em ‘Y’. Eleva a harmonia e deixa o contraste pouco menos impactante.";
      s = harmComD;
      textFont(font); 
      fill(0);
      text(s, 270, 460, 500, 150);
      fill(cComplementarD1);
      stroke(0);
      rect(325,300,150,150);
      fill(cComplementarD2);
      stroke(0);
      rect(525,300, 150,150);
      fill(0);
      text ("Cor Usuário: ", 300, 100, 500, 50);
      fill(0);
      text("Cores Harmonicas: ", 300, 270, 500, 50);
      textFont(t);
      fill(255,0,0);
      text("Harmonia Complementar Dividida", 300, 25,500, 50);
      fill(cUsuario);
      stroke(0);
      rect(425,75, 150, 150);
      redraw();
    }
    //COMPLEMENTAR DUPLA
    if(harm5 == true)
    {
      background(205);
      smooth();         
      ellipseMode(RADIUS);
      noStroke();
      raio_do_circulo =  200;
      largura_dos_segmentos = raio_do_circulo / segmentos;
      drawCirculoDeCores();
      String harmDupC;
      harmDupC = "Segue o princípio da combinação complementar, no entanto, como sugere o nome, são utilizadas dois pares de cores"
      + " – duas escolhidas e suas opostas complementares. Além do grande contraste, fornece uma riqueza em cores. No entanto, é tida como a harmonia mais difícil de se trabalhar.";
      s = harmDupC;
      textFont(font); 
      fill(0);
      text(s, 270, 460, 500, 150);
      fill(cDupla1);
      stroke(0);
      rect(300,300,125,125);          
      fill(cDupla2);
      stroke(0);
      rect(435,300, 125,125);         
      fill(cDupla3);
      stroke(0);
      rect(570,300,125,125);    
      fill(0);
      text ("Cor Usuário: ", 300, 100, 500, 50);
      fill(0);
      text("Cores Harmonicas: ", 300, 270, 500, 50);
      textFont(t);
      fill(255,0,0);
      text("Harmonia Complementar Dupla", 300, 25,500, 50);
      fill(cUsuario);
      stroke(0);
      rect(425,75, 150, 150);
      redraw();
    }
    if(harm6==true)
    {
      background(205);
      smooth();         
      ellipseMode(RADIUS);
      noStroke();
      raio_do_circulo =  200;
      largura_dos_segmentos = raio_do_circulo / segmentos;
      drawCirculoDeCores();
      String harmQuadra;
      harmQuadra = "Formada por tétrades que definem um quadrado formado pela união de duas díades perpendiculares entre si."
      + "Também é possível fazer uma tétrade a partir de um retângulo formado por duas díades a 60⁰ entre si.";
      s = harmQuadra;
      textFont(font); 
      fill(0);
      text(s, 270, 460, 500, 150);    
      fill (cQuadra1);
      stroke(0);
      rect(300,300,125,125);        
      fill(cQuadra2);
      stroke(0);
      rect(435,300, 125,125);     
      fill(cQuadra3);
      stroke(0);
      rect(570,300,125,125);      
      fill(0);
      text ("Cor Usuário: ", 300, 100, 500, 50);
      fill(0);
      text("Cores Harmonicas: ", 300, 270, 500, 50);
      textFont(t);
      fill(255,0,0);
      text("Harmonia Quadrática", 300, 25, 500, 50);
      fill(cUsuario);
      stroke(0);
      rect(425,75, 150, 150);
      redraw();
    } 
  }
  
////////////////////////////////////////////////////////////////////////

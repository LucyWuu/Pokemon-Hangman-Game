% Lucy Wu
% May 31, 2019
% ICS Summative Project
% This program conducts a game of "Guess the Word" with special features and graphics.

% Set the screen area 
setscreen ("graphics: 1260;900")

% Prevent the flickering effect
View.UpdateArea(0,0,maxx,maxy)

% Declaration of constants and variables
var points := 100
var secretWord, playerGuess : string
var numberOfLetters: int
var finalGuess := "" 
var guessDisplay := ""
var wordCheck := ""

% For mouse button click
var x, y, bnum, bud : int

% Image setup
var pokeball :int := Pic.FileNew ("pokeball.bmp") 
var pokeballPic : int
var pikachu :int := Pic.FileNew ("pikachu bgm.bmp") 
var pikachuPic : int
var meowth :int := Pic.FileNew ("Meowth.bmp") 
var meowthPic : int
var pikachuAndMeowth :int := Pic.FileNew ("PikachuandMeowth.bmp") 
var pikachuAndMeowthPic : int
var keyboard :int := Pic.FileNew ("Keyboard.bmp")
var pikachuWin :int := Pic.FileNew ("pikachuWin.bmp") 
var pikachuWinPic : int
var pikachuWin2 :int := Pic.FileNew ("pikachuWin2.bmp") 
var pikachuWin2Pic : int
var sad2Pikachu :int := Pic.FileNew ("sad2pikachu.bmp") 
var sad2PikachuPic : int
var cryPikachu :int := Pic.FileNew ("cryPikachu.bmp") 
var cryPikachuPic : int

% Set up the font size and style
var font1,font2,font3 : int
font1 := Font.New ("SERIF:50") 
font2 := Font.New ("sans serif:30")
font3 := Font.New ("sans serif:15")
assert font1 > 0 and font2 > 0 and font3 > 0

%-----------------------------------------------------------------------------------------------------------------------------------------------------------
% Opening graphics
% The background move from the top to bottom of the screen.  
for decreasing yCoord : maxy .. 0 
    drawfillbox (0, yCoord,1260,yCoord-50,78) 
    delay(1) 
end for 

% Insert background pokeballs.
drawfilloval (215,235,45,45,white) 
pokeballPic := Pic.Scale (pokeball, 100, 100)
Pic.Draw (pokeballPic, 165, 185, picMerge) 
drawfilloval (615,835,45,45,white) 
pokeballPic := Pic.Scale (pokeball, 100, 100)
Pic.Draw (pokeballPic, 565, 785, picMerge)
drawfilloval (715,135,45,45,white) 
pokeballPic := Pic.Scale (pokeball, 100, 100)
Pic.Draw (pokeballPic, 665, 85, picMerge)
drawfilloval (1115,635,45,45,white) 
pokeballPic := Pic.Scale (pokeball, 100, 100)
Pic.Draw (pokeballPic, 1065, 585, picMerge)
drawfilloval (115,660,45,45,white) 
pokeballPic := Pic.Scale (pokeball, 100, 100)
Pic.Draw (pokeballPic, 65, 610, picMerge)
drawfilloval (1115,240,45,45,white) 
pokeballPic := Pic.Scale (pokeball, 100, 100)
Pic.Draw (pokeballPic, 1065, 190, picMerge)
drawfilloval (445,60,45,45,white) 
pokeballPic := Pic.Scale (pokeball, 100, 100)
Pic.Draw (pokeballPic, 395, 10, picMerge)
drawfilloval (75,90,45,45,white) 
pokeballPic := Pic.Scale (pokeball, 100, 100)
Pic.Draw (pokeballPic,25, 40, picMerge)
drawfilloval (965,55,45,45,white) 
pokeballPic := Pic.Scale (pokeball, 100, 100)
Pic.Draw (pokeballPic,915,5, picMerge)
drawfilloval (365,755,45,45,white) 
pokeballPic := Pic.Scale (pokeball, 100, 100)
Pic.Draw (pokeballPic,315,705, picMerge)
drawfilloval (965,705,45,45,white) 
pokeballPic := Pic.Scale (pokeball, 100, 100)
Pic.Draw (pokeballPic,915,655, picMerge)
drawfilloval (515,605,45,45,white) 
pokeballPic := Pic.Scale (pokeball, 100, 100)
Pic.Draw (pokeballPic,465,555, picMerge)



% Display the block that holds the title move from left to right.
for xCoord : 0 .. maxx
    drawfillbox (xCoord - 1260,300,xCoord,600,7) 
    delay (1) 
end for 


% Animation for the title of our game to appear. 
Font.Draw ("THE", 240,450, font1, 0) 
delay (250)
Font.Draw ("BATTLE", 400,450,font1,0)
delay (250)
Font.Draw ("OF",680,450,font1,0)
delay (250)
Font.Draw ("WORDS",790,450,font1,0) 
Font.Draw ("By: Lucy Wu", 530, 400, font2,0)                    
Font.Draw ("Click anywhere to continue", 520,370,font3,0)                         


% Insert the Pikachu image. 
drawfillbox (120,450,150,500,white)                                             % Filling the eye of the Pikachu.
drawfillbox (125,485,180,515,white)
pikachuPic := Pic.Scale (pikachu, 250,300)
Pic.Draw (pikachuPic, 5, 300, picMerge)

% Insert the Meowth image. 
drawfillbox (1110,470,1210,530,white)                                           % Filling the eye of the Meowth.
meowthPic := Pic.Scale (meowth, 200,300)
Pic.Draw (meowthPic, 1050, 300, picMerge) 

% Inform the user to press any key to continue. 
loop
buttonwait("down", x, y, bnum,bud)
exit when x > 0 and x < 1260 and y > 0 and y < 900 
end loop

%-----------------------------------------------------------------------------------------------------------------------------------------------------------

% Movement of the page for displaying the objective and rules of the game.
   
for xCoord : 0 .. maxx
    drawfillbox (xCoord - 1260,0,xCoord,900,91)
    drawfillbox (xCoord-1260, 200,xCoord, 800,black) 
    Time.Delay (1) 
    View.UpdateArea (0,0,maxx,maxy)
end for 


% Display the objective and the rules of the game. 
Font.Draw ("Storyline:",10,720,font2,white)
Font.Draw ("You are a Pokemon trainer who is battling with another trainer.",10, 680,font3, white)
Font.Draw ("Your Pikachu is frighting against your opponent's Pokemon, Meowth.",10,650,font3,white)
Font.Draw ("Objective:", 10,560,font2,white)
Font.Draw ("Try to guess a secret word without losing all your points.", 10,530, font3, white) 
Font.Draw ("Rules: ", 10, 430, font2, white) 
Font.Draw ("You start with 100 points. For each letter that you guess, you lose 10 points." ,10, 400, font3, white) 
Font.Draw ("You can guess the secret word at any time (press \"!\"), but if you guessed incorrectly, then you will lose all your remaining points.", 10,370,font3,white)
Font.Draw ("If you lose all your points before you choose to guess the secret word, then you will be forced to guess the secret word.",10,340,font3,white)
Font.Draw ("Either way, you will gain 10 points if you guessed the secret word correctly as your final guess!",10,310,font3,white) 


% Insert the picture of Pikachu and Meowth together.
drawfillbox (970,600,1100,690,white)    % filling of the eye.
pikachuAndMeowthPic := Pic.Scale (pikachuAndMeowth, 300, 300)
Pic.Draw (pikachuAndMeowthPic, 850, 450, picMerge)

% Inform user to click anywhere to continue.
Font.Draw ("Click anywhere to continue",500,250,font3,white)

loop
buttonwait("down", x, y, bnum,bud)
exit when x > 0 and x < 1260 and y > 0 and y < 900 
end loop 


% Display the gaming page.
drawfillbox (0,0,1260,900,76)   % sky
drawfillbox (0,0,1260,300,119)  % grass
drawfilloval (160,400,40,20,0)  % clouds
drawfilloval (210,420,60,40,0) 
drawfilloval (240,450,50,60,0) 
drawfilloval (290,420,50,30,0) 
drawfilloval (950,400,40,20,0)  % clouds
drawfilloval (1000,420,60,40,0) 
drawfilloval (1040,450,50,60,0) 
drawfilloval (1080,420,50,30,0) 
drawfilloval (1100,800,40,20,0) % clouds
drawfilloval (1150,820,60,40,0) 
drawfilloval (1190,850,50,60,0) 
drawfilloval (1230,820,50,30,0) 
drawfilloval (100,800,40,20,0)  % clouds
drawfilloval (150,820,60,40,0) 
drawfilloval (190,850,50,60,0) 
drawfilloval (230,820,50,30,0) 

% Insert the Pikachu image. 
pikachuPic := Pic.Scale (pikachu, 280,340)
Pic.Draw (pikachuPic, 80, 220, picMerge) 

% Insert the Meowth image.
meowthPic := Pic.Scale (meowth, 250,340)
Pic.Draw (meowthPic, 900, 210, picMerge) 
Pic.Draw (keyboard, 300, 60, 0)

%-----------------------------------------------------------------------------------------------------------------------------------------------------------

% This functions randomly chooses a secret word.
function getSecretWord : string

% array of 12 secret words (all in capital letters)
    var words : array 1 .. 12 of string := init( "MANGOSTEEN", "GRAPEFRUIT", "CANTALOUPE","CHIMPANZEE", "TIMBERWOLF", "WOODPECKER" ,"TAJIKISTAN", "MONTENEGRO", "LUXEMBOURG","NIGHTSTAND","CONFIDANTE","CELLARETTE" )
    var number : int
    
    randint (number, 1, 12)
    result words (number)

end getSecretWord


% This line of code to generate a secret word and store it in "secretWord".
secretWord := getSecretWord

% Special feature: Identify the catagory that the secret word belongs to, and give the user the hint. 
case secretWord of 
    label "MANGOSTEEN", "GRAPEFRUIT", "CANTALOUPE" :
	Draw.Text ( "Hint: The secret word is the name of a fruit.", 200, 850, font2, 7)        % fruit
    label "CHIMPANZEE", "TIMBERWOLF", "WOODPECKER" :
	Draw.Text ( "Hint: The secret word is the name of an animal.", 200, 850, font2, 7)      % animal 
    label "TAJIKISTAN", "MONTENEGRO", "LUXEMBOURG" :
	Draw.Text ( "Hint: The secret word is the name of a country.", 200, 850, font2, 7)      % country
    label "NIGHTSTAND","CONFIDANTE","CELLARETTE" : 
	Draw.Text ( "Hint: The secret word is the name of a furniture.", 200, 850, font2, 7)    % turniture

end case 


% This line finds out the length of the secret word.
numberOfLetters := length(secretWord)

for wordCount : 1 .. numberOfLetters
    % Determines the number of "underscores" that the secret word will display.
    guessDisplay := guessDisplay + "_ " 
    % Determines the value of the variable "wordCheck", which will be used later for checking letters.
    wordCheck := wordCheck + secretWord(wordCount) + " "
end for
%-----------------------------------------------------------------------------------------------------------------------------------------------------------

% Informs the user about the current amount of points and the word length.
Draw.Text (guessDisplay, 800,700,font2,7) 
Draw.Text ("Points: "+ intstr(points),10,700,font2,7) 

% Determine and display the number of letters the secret word contains.
Draw.Text( "The secret word has " +(intstr(numberOfLetters)) + " letters.",350,800,font2,black) 

% Used for the keyboard interface.
loop 
    % If the mouth button is pressed down in the place of the keyboard,
    % proceeds to check which keyboard button is clicked.
    buttonwait("down", x, y, bnum,bud)
    if x > 300 and x < 972 and y > 70 and y < 173 then
	% Check if "!" is clicked, if it is, go staight ahead to another page to guess the entire word:
	if x > 878 and x < 928 and y > 60 and y < 110 then
	    exit
	% Check if letter A is clicked:
	elsif x > 300 and x < 350 and y > 110 and y < 173 then
	    playerGuess := "A"
	    % Colour the button grey, so that the user would not press it again.
	    drawfillbox(302, 110, 350, 170, 24)
	    
	% Check if letter B is clicked:    
	elsif x > 350 and x < 399 and y > 110 and y < 173 then
	    playerGuess := "B"
	    % Colour the button grey, so that the user would not press it again.
	    drawfillbox(350, 110, 400, 170, 24)
	    
	% Check if letter C is clicked:    
	elsif x > 399 and x < 446 and y > 110 and y < 173 then
	    playerGuess := "C"
	    % Colour the button grey, so that the user would not press it again.
	    drawfillbox(399, 110, 446, 170, 24)
	    
	% Check if letter D is clicked:    
	elsif x > 446 and x < 497 and y > 110 and y < 173 then
	    playerGuess := "D"
	    % Colour the button grey, so that the user would not press it again.
	    drawfillbox(446, 110, 497, 170, 24)
	    
	% Check if letter E is clicked:    
	elsif x > 497 and x < 542 and y > 110 and y < 173 then
	    playerGuess := "E"
	    % Colour the button grey, so that the user would not press it again.
	    drawfillbox(497, 110, 542, 170, 24)
	    
	% Check if letter F is clicked:    
	elsif x > 542 and x < 593 and y > 110 and y < 173 then
	    playerGuess := "F"
	    % Colour the button grey, so that the user would not press it again.
	    drawfillbox(542, 110, 593, 170, 24)
	    
	% Check if letter G is clicked:    
	elsif x > 593 and x < 640 and y > 110 and y < 173 then
	    playerGuess := "G"
	    % Colour the button grey, so that the user would not press it again.
	    drawfillbox(593, 110, 640, 170, 24)
	    
	% Check if letter H is clicked:    
	elsif x > 640 and x < 685 and y > 110 and y < 173 then
	    playerGuess := "H"
	    % Colour the button grey, so that the user would not press it again.
	    drawfillbox(640, 110, 685, 170, 24)
	    
	% Check if letter I is clicked:    
	elsif x > 685 and x < 736 and y > 110 and y < 173 then
	    playerGuess := "I"
	    % Colour the button grey, so that the user would not press it again.
	    drawfillbox(685, 110, 736, 170, 24)
	    
	% Check if letter J is clicked:    
	elsif x > 736 and x < 781 and y > 110 and y < 173 then
	    playerGuess := "J"
	    % Colour the button grey, so that the user would not press it again.
	    drawfillbox(736, 110, 781, 170, 24)
	
	% Check if letter K is clicked:    
	elsif x > 781 and x < 829 and y > 110 and y < 173 then
	    playerGuess := "K"
	    % Colour the button grey, so that the user would not press it again.
	    drawfillbox(781, 110, 829, 170, 24)
	
	% Check if letter L is clicked:    
	elsif x > 829 and x < 878 and y > 110 and y < 173 then
	    playerGuess := "L"
	    % Colour the button grey, so that the user would not press it again.
	    drawfillbox(829, 110, 878, 170, 24)
	
	% Check if letter M is clicked:    
	elsif x > 878 and x < 928 and y > 110 and y < 173 then
	    playerGuess := "M"
	    % Colour the button grey, so that the user would not press it again.
	    drawfillbox(878, 110, 928, 170, 24)
	
	% Check if letter N is clicked:    
	elsif x > 928 and x < 972 and y > 110 and y < 173 then
	    playerGuess := "N"
	    % Colour the button grey, so that the user would not press it again.
	    drawfillbox(928, 110, 972, 170, 24)
	   
	% Check if letter O is clicked:
	elsif x > 300 and x < 350 and y > 60 and y < 110 then
	    playerGuess := "O"
	    % Colour the button grey, so that the user would not press it again.
	    drawfillbox(300, 60, 350, 110, 24)
	    
	% Check if letter P is clicked:    
	elsif x > 350 and x < 399 and y > 60 and y < 110 then
	    playerGuess := "P"
	    % Colour the button grey, so that the user would not press it again.
	    drawfillbox(350, 60, 400, 110, 24)
	    
	% Check if letter Q is clicked:    
	elsif x > 399 and x < 446 and y > 60 and y < 110 then
	    playerGuess := "Q"
	    % Colour the button grey, so that the user would not press it again.
	    drawfillbox(399, 60, 446, 110, 24)
	    
	% Check if letter R is clicked:    
	elsif x > 446 and x < 497 and y > 60 and y < 110 then
	    playerGuess := "R"
	    % Colour the button grey, so that the user would not press it again.
	    drawfillbox(446, 60, 497, 110, 24)
	    
	% Check if letter S is clicked:    
	elsif x > 497 and x < 542 and y > 60 and y < 110 then
	    playerGuess := "S"
	    % Colour the button grey, so that the user would not press it again.
	    drawfillbox(497, 60, 542, 110, 24)
	    
	% Check if letter T is clicked:    
	elsif x > 542 and x < 593 and y > 60 and y < 110 then
	    playerGuess := "T"
	    % Colour the button grey, so that the user would not press it again.
	    drawfillbox(542, 60, 593, 110, 24)
	    
	% Check if letter U is clicked:    
	elsif x > 593 and x < 640 and y > 60 and y < 110 then
	    playerGuess := "U"
	    % Colour the button grey, so that the user would not press it again.
	    drawfillbox(593, 60, 640, 110, 24)
	    
	% Check if letter V is clicked:    
	elsif x > 640 and x < 685 and y > 60 and y < 110 then
	    playerGuess := "V"
	    % Colour the button grey, so that the user would not press it again.
	    drawfillbox(640, 60, 685, 110, 24)
	    
	% Check if letter W is clicked:    
	elsif x > 685 and x < 736 and y > 60 and y < 110 then
	    playerGuess := "W"
	    % Colour the button grey, so that the user would not press it again.
	    drawfillbox(685, 60, 736, 110, 24)
	    
	% Check if letter X is clicked:    
	elsif x > 736 and x < 781 and y > 60 and y < 110 then
	    playerGuess := "X"
	    % Colour the button grey, so that the user would not press it again.
	    drawfillbox(736, 60, 781, 110, 24)
	
	% Check if letter Y is clicked:    
	elsif x > 781 and x < 829 and y > 60 and y < 110 then
	    playerGuess := "Y"
	    % Colour the button grey, so that the user would not press it again.
	    drawfillbox(781, 60, 829, 110, 24)
	
	% Check if letter Z is clicked:    
	elsif x > 829 and x < 878 and y > 60 and y < 110 then
	    playerGuess := "Z"
	    % Colour the button grey, so that the user would not press it again.
	    drawfillbox(829, 60, 878, 110, 24)        
	end if
	
	% Check if the letter that the player guessed exists in the secret word.
	% If it is  in the word, replace the original underscores with the chosen letter.
	if playerGuess = wordCheck(1) then
	    guessDisplay := playerGuess + guessDisplay(2 .. *)
		drawfillbox (790,680,1260,780,76)                           % Cover the previous bars of letter.              
		Draw.Text (guessDisplay, 800,700,font2,7)                   % Display if user entered a correct letter.            
	end if
	for letterCheck : 2 .. length(wordCheck)
	    if playerGuess = wordCheck(letterCheck) then
		guessDisplay := guessDisplay(1 .. letterCheck - 1) + playerGuess + guessDisplay(letterCheck + 1 .. *)
	     end if
	end for
	% Every guess equals to 10 points reduction. When the points reached zero, go to a new interface to enter the final guess.
	points := points - 10
	drawfillbox (790,680,1260,780,76)                                   % Cover the previous bars of letter.   
	Draw.Text (guessDisplay, 800,700,font2,7)                           % Display if user entered a correct letter.            
	drawfillbox (10,700,250,780,76)                                     % Cover the previous score.
	Draw.Text ("Points:" + intstr(points),10,700,font2,7)
	% When user used all their tries, proceed to the next interface.
	exit when points = 0
	% If the player successfully guess the whole word, exit.
	exit when guessDisplay = wordCheck
    end if
end loop

%-----------------------------------------------------------------------------------------------------------------------------------------------------------
% Enters the page where the player guesses the entire word.

% Sets new background.
drawfillbox (0, 0, 1260, 900, 76)
% Reinsert the keyboard image (the bad side that represnets the opponent). 
Pic.Draw (keyboard, 300, 60, 0)
% Inform the user they may guess the secret word now.
Draw.Text ("You have one more guess! Enter your final guess!", 200,700,font2,7) 

% Allow user to enter their final guess of the secret word. 
if guessDisplay not= wordCheck then
   loop 
    buttonwait("down", x, y, bnum,bud)
      if x > 300 and x < 972 and y > 70 and y < 173 then
	% Check if letter A is clicked:
	if x > 300 and x < 350 and y > 110 and y < 173 then
	    playerGuess := "A"
	    
	% Check if letter B is clicked:    
	elsif x > 350 and x < 399 and y > 110 and y < 173 then
	    playerGuess := "B"
	    
	% Check if letter C is clicked:    
	elsif x > 399 and x < 446 and y > 110 and y < 173 then
	    playerGuess := "C"
	   
	% Check if letter D is clicked:    
	elsif x > 446 and x < 497 and y > 110 and y < 173 then
	    playerGuess := "D"
	   
	% Check if letter E is clicked:    
	elsif x > 497 and x < 542 and y > 110 and y < 173 then
	    playerGuess := "E"
	   
	% Check if letter F is clicked:    
	elsif x > 542 and x < 593 and y > 110 and y < 173 then
	    playerGuess := "F"
	    
	% Check if letter G is clicked:    
	elsif x > 593 and x < 640 and y > 110 and y < 173 then
	    playerGuess := "G"
	    
	% Check if letter H is clicked:    
	elsif x > 640 and x < 685 and y > 110 and y < 173 then
	    playerGuess := "H"
	   
	% Check if letter I is clicked:    
	elsif x > 685 and x < 736 and y > 110 and y < 173 then
	    playerGuess := "I"
	   
	% Check if letter J is clicked:    
	elsif x > 736 and x < 781 and y > 110 and y < 173 then
	    playerGuess := "J"
	    
	% Check if letter K is clicked:    
	elsif x > 781 and x < 829 and y > 110 and y < 173 then
	    playerGuess := "K"
	   
	% Check if letter L is clicked:    
	elsif x > 829 and x < 878 and y > 110 and y < 173 then
	    playerGuess := "L"
	   
	% Check if letter M is clicked:    
	elsif x > 878 and x < 928 and y > 110 and y < 173 then
	    playerGuess := "M"
	   
	% Check if letter N is clicked:    
	elsif x > 928 and x < 972 and y > 110 and y < 173 then
	    playerGuess := "N"
	   
	% Check if letter O is clicked:
	elsif x > 300 and x < 350 and y > 60 and y < 110 then
	    playerGuess := "O"
	    
	% Check if letter P is clicked:    
	elsif x > 350 and x < 399 and y > 60 and y < 110 then
	    playerGuess := "P"
	   
	% Check if letter Q is clicked:    
	elsif x > 399 and x < 446 and y > 60 and y < 110 then
	    playerGuess := "Q"
	   
	% Check if letter R is clicked:    
	elsif x > 446 and x < 497 and y > 60 and y < 110 then
	    playerGuess := "R"
	   
	% Check if letter S is clicked:    
	elsif x > 497 and x < 542 and y > 60 and y < 110 then
	    playerGuess := "S"
	    
	% Check if letter T is clicked:    
	elsif x > 542 and x < 593 and y > 60 and y < 110 then
	    playerGuess := "T"
	   
	% Check if letter U is clicked:    
	elsif x > 593 and x < 640 and y > 60 and y < 110 then
	    playerGuess := "U"
	   
	% Check if letter V is clicked:    
	elsif x > 640 and x < 685 and y > 60 and y < 110 then
	    playerGuess := "V"
	    
	% Check if letter W is clicked:    
	elsif x > 685 and x < 736 and y > 60 and y < 110 then
	    playerGuess := "W"
	   
	% Check if letter X is clicked:    
	elsif x > 736 and x < 781 and y > 60 and y < 110 then
	    playerGuess := "X"
	   
	% Check if letter Y is clicked:    
	elsif x > 781 and x < 829 and y > 60 and y < 110 then
	    playerGuess := "Y"
	    
	% Check if letter Z is clicked:    
	elsif x > 829 and x < 878 and y > 60 and y < 110 then
	    playerGuess := "Z"     
	end if
	finalGuess := finalGuess + playerGuess                  % concatenating the player's guess
	Draw.Text (finalGuess, 450,600,font2,7)                 %Display the user's final guess   
	exit when length(finalGuess) = length(secretWord)       % go to final check when amount letter entered is equal to the length of secret word.
	end if
    end loop 
end if

% Keep the screen transition clear and neat.
cls

%-----------------------------------------------------------------------------------------------------------------------------------------------------------

% Checks if the user guessed the secret guess correctly or not, if yes, enter the winning graphic page.
if finalGuess = secretWord or wordCheck = guessDisplay then 
    % Move new page from left to right.  
    for decreasing yCoord : maxy .. 0 
	drawfillbox (0, yCoord,1260,yCoord-50,91) 
	delay(1) 
    end for 

    % Insert background pokeballs.
    drawfilloval (215,235,45,45,white) 
    pokeballPic := Pic.Scale (pokeball, 100, 100)
    Pic.Draw (pokeballPic, 165, 185, picMerge) 
    drawfilloval (615,835,45,45,white) 
    pokeballPic := Pic.Scale (pokeball, 100, 100)
    Pic.Draw (pokeballPic, 565, 785, picMerge) 
    drawfilloval (715,135,45,45,white) 
    pokeballPic := Pic.Scale (pokeball, 100, 100)
    Pic.Draw (pokeballPic, 665, 85, picMerge)
    drawfilloval (1115,635,45,45,white) 
    pokeballPic := Pic.Scale (pokeball, 100, 100)
    Pic.Draw (pokeballPic, 1065, 585, picMerge) 
    drawfilloval (115,660,45,45,white) 
    pokeballPic := Pic.Scale (pokeball, 100, 100)
    Pic.Draw (pokeballPic, 65, 610, picMerge) 
    drawfilloval (1115,240,45,45,white) 
    pokeballPic := Pic.Scale (pokeball, 100, 100)
    Pic.Draw (pokeballPic, 1065, 190, picMerge) 
    drawfilloval (445,60,45,45,white) 
    pokeballPic := Pic.Scale (pokeball, 100, 100)
    Pic.Draw (pokeballPic, 395, 10, picMerge) 
    drawfilloval (75,90,45,45,white) 
    pokeballPic := Pic.Scale (pokeball, 100, 100)
    Pic.Draw (pokeballPic,25, 40, picMerge) 
    drawfilloval (965,55,45,45,white) 
    pokeballPic := Pic.Scale (pokeball, 100, 100)
    Pic.Draw (pokeballPic,915,5, picMerge) 
    drawfilloval (365,755,45,45,white) 
    pokeballPic := Pic.Scale (pokeball, 100, 100)
    Pic.Draw (pokeballPic,315,705, picMerge) 
    drawfilloval (965,705,45,45,white) 
    pokeballPic := Pic.Scale (pokeball, 100, 100)
    Pic.Draw (pokeballPic,915,655, picMerge) 
    drawfilloval (515,605,45,45,white) 
    pokeballPic := Pic.Scale (pokeball, 100, 100)
    Pic.Draw (pokeballPic,465,555, picMerge)    
    
    % The block that holds the words, moving from left to right. 
    for xCoord : 0 .. maxx
	drawfillbox (xCoord - 1260,300,xCoord,600,7) 
	delay (1) 
    end for 

    % Insert picture of happy Pikachu.
    drawfillbox (133,450,210,480,0)          
    pikachuWinPic := Pic.Scale (pikachuWin, 280, 280)
    Pic.Draw (pikachuWinPic, 10, 310, picMerge)

    % Insert picture of another happy Pikachu. 
    pikachuWin2Pic := Pic.Scale (pikachuWin2, 250, 280)
    Pic.Draw (pikachuWin2Pic, 1000, 285, picMerge)
    
    % Display text that congradulates the user for winning.
    Font.Draw ("Congratulations, you guessed right!", 200,500, font1,0) 
    % Display text informing the user their remaining points
    Font.Draw ("You ended the game with " + (intstr(points)) + " points.", 350,420,font2,0) 
    
else

    % Enter the closing graphic for losing. 
    %The background that rolls in from the top to bottom of the screen.  
    for decreasing yCoord : maxy .. 0 
	drawfillbox (0, yCoord,1260,yCoord-50,91) 
	delay(1) 
    end for 

    % Insert background pokeballs.
    drawfilloval (215,235,45,45,white) 
    pokeballPic := Pic.Scale (pokeball, 100, 100)
    Pic.Draw (pokeballPic, 165, 185, picMerge)  
    drawfilloval (615,835,45,45,white) 
    pokeballPic := Pic.Scale (pokeball, 100, 100)
    Pic.Draw (pokeballPic, 565, 785, picMerge) 
    drawfilloval (715,135,45,45,white) 
    pokeballPic := Pic.Scale (pokeball, 100, 100)
    Pic.Draw (pokeballPic, 665, 85, picMerge) 
    drawfilloval (1115,635,45,45,white) 
    pokeballPic := Pic.Scale (pokeball, 100, 100)
    Pic.Draw (pokeballPic, 1065, 585, picMerge) 
    drawfilloval (115,660,45,45,white) 
    pokeballPic := Pic.Scale (pokeball, 100, 100)
    Pic.Draw (pokeballPic, 65, 610, picMerge) 
    drawfilloval (1115,240,45,45,white) 
    pokeballPic := Pic.Scale (pokeball, 100, 100)
    Pic.Draw (pokeballPic, 1065, 190, picMerge) 
    drawfilloval (445,60,45,45,white) 
    pokeballPic := Pic.Scale (pokeball, 100, 100)
    Pic.Draw (pokeballPic, 395, 10, picMerge) 
    drawfilloval (75,90,45,45,white) 
    pokeballPic := Pic.Scale (pokeball, 100, 100)
    Pic.Draw (pokeballPic,25, 40, picMerge) 
    drawfilloval (965,55,45,45,white) 
    pokeballPic := Pic.Scale (pokeball, 100, 100)
    Pic.Draw (pokeballPic,915,5, picMerge) 
    drawfilloval (365,755,45,45,white) 
    pokeballPic := Pic.Scale (pokeball, 100, 100)
    Pic.Draw (pokeballPic,315,705, picMerge) 
    drawfilloval (965,705,45,45,white) 
    pokeballPic := Pic.Scale (pokeball, 100, 100)
    Pic.Draw (pokeballPic,915,655, picMerge) 
    drawfilloval (515,605,45,45,white) 
    pokeballPic := Pic.Scale (pokeball, 100, 100)
    Pic.Draw (pokeballPic,465,555, picMerge)

    % The block that holds the words, moving from left to right. 
    for xCoord : 0 .. maxx
	drawfillbox (xCoord - 1260,300,xCoord,600,7) 
	delay (1) 
    end for 

    % Display text, telling user they lost the game.
    Font.Draw ("Sorry, the game is over." , 340,490, font1, 0) 
    % Display the actual secret word.
    Font.Draw ("The secret word is \"" + secretWord + "\".", 470,430, font3, 0)
    % Display text, telling user they ended game with no points.
    Font.Draw ("You ended the game with 0 points.", 460,370,font3,0) 

    % insert picture of a sad Pikachu. 
    sad2PikachuPic := Pic.Scale (sad2Pikachu, 300, 340)
    Pic.Draw (sad2PikachuPic, 40, 285, picMerge) 

    % Insert picture of a crying Pikachu. 
    cryPikachuPic := Pic.Scale (cryPikachu, 300, 300)
    Pic.Draw (cryPikachuPic, 950, 300, picMerge) 
end if 


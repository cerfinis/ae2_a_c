import 'package:flutter/material.dart';

const Color orangeHealthBar = Color(0xFFFF5722);
const Color pinkBadges = Color(0xFFE91E63);
const Color greenCompanion = Color(0xFF4CAF50);
const Color purpleDialogue = Color(0xFF9C27B0);
const Color yellowText = Colors.yellow;

const Map<String, String> badgeAssets = {
  'marine': 'assets/badge_marine.png',
  'forest': 'assets/badge_forest.png',
  'water': 'assets/badge_water.png',
  'food': 'assets/badge_food.png',
  'biodiversity': 'assets/badge_biodiversity.png',
};

const Map<String, String> companionAssets = {
  'captain': 'assets/captain_green.png',
  'turtle': 'assets/turtle.png',
  'squirrel': 'assets/squirrel.png',
  'frog': 'assets/frog.png',
  'worm': 'assets/worm.png',
  'bird': 'assets/bird.png',
};

const List<String> scenarioOrder = [
  'marine',
  'forest',
  'water',
  'food',
  'biodiversity',
];

final Map<String, Map<String, String>> scenarioData = {
  'marine': {
    'title': 'Save the Oceans!',
    'question': 'Tallulah the Turtle is sad because the beach is full of plastic!\nWhat should you do?',
    'good1': 'Pick up the plastic and put it in the recycling bin',
    'good2': 'Use a reusable bag instead of plastic bags',
    'bad': 'Leave the plastic on the beach',
    'goodDialogue': 'Amazing! You helped Tallulah and all the sea animals!',
    'badDialogue': 'Oh no! Plastic hurts turtles and fish. Let’s try again!',
  },
  'forest': {
    'title': 'Protect the Forests!',
    'question': 'Samuel the Squirrel sees someone throwing paper on the ground!\nWhat is the best thing to do?',
    'good1': 'Recycle the paper',
    'good2': 'Use both sides of the paper',
    'bad': 'Throw more paper on the ground',
    'goodDialogue': 'Yay! You saved trees and gave Samuel more nuts!',
    'badDialogue': 'Oops! Trees give us oxygen. Let’s be kinder to forests!',
  },
  'water': {
    'title': 'Save Water!',
    'question': 'Felix the Frog’s pond is getting smaller because water is being wasted!\nWhat should you do?',
    'good1': 'Turn off the tap while brushing teeth',
    'good2': 'Take shorter showers',
    'bad': 'Leave the tap running all day',
    'goodDialogue': 'Ribbit-tastic! Felix has plenty of water to swim now!',
    'badDialogue': 'Oh dear! We need to save water for animals and people.',
  },
  'food': {
    'title': 'Grow Healthy Food!',
    'question': 'Wiggles the Worm helps make soil rich, but food is being wasted!\nWhat is the right choice?',
    'good1': 'Make a compost bin with fruit and veggie scraps',
    'good2': 'Only take as much food as you can eat',
    'bad': 'Throw food in the rubbish bin',
    'goodDialogue': 'Wiggle-wonderful! Healthy soil means yummy food!',
    'badDialogue': 'Wasting food is sad. Let’s feed Wiggles instead!',
  },
  'biodiversity': {
    'title': 'Love All Animals & Plants!',
    'question': 'Brooklyn the Bird sees a garden with no flowers or insects!\nWhat will help nature the most?',
    'good1': 'Plant flowers that bees and butterflies love',
    'good2': 'Make a bug hotel for insects to live in',
    'bad': 'Cut down all the plants and flowers',
    'goodDialogue': 'Tweet-tweet! You made a happy home for everyone!',
    'badDialogue': 'Every animal and plant is important. Let’s try again!',
  },
};
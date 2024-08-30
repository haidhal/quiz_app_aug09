import 'package:flutter/foundation.dart';

class DummyDb {
 
  static List<List<Map>> categoryQns = [
    [
      {
        "question": "What is the length of a standard marathon race?",
        "options": [
          "21 kilometers",
          "42 kilometers",
          "10 kilometers",
          "50 kilometers"
        ],
        "answer": 1
      },
      {
        "question":
            "What is the name of the trophy awarded to the champion of the NBA?",
        "options": [
          "Vince Lombardi Trophy",
          "Stanley Cup",
          "Larry O'Brien Trophy",
          "Commissioner's Trophy"
        ],
        "answer": 2
      },
      {
        "question": "Which athlete is known as the 'Fastest Man in the World'?",
        "options": ["Usain Bolt", "Michael Johnson", "Carl Lewis", "Tyson Gay"],
        "answer": 0
      },
      {
        "question": "In which sport would you perform a 'triple axel'?",
        "options": ["Figure Skating", "Gymnastics", "Ski Jumping", "Diving"],
        "answer": 0
      },
      {
        "question":
            "How many players are on a standard volleyball team on the court at one time?",
        "options": ["5", "6", "7", "8"],
        "answer": 1
      },
      {
        "question":
            "What is the maximum break possible in a single frame of snooker?",
        "options": ["147", "150", "100", "99"],
        "answer": 0
      },
      {
        "question":
            "Which country won the most gold medals in the 2020 Tokyo Olympics?",
        "options": ["USA", "China", "Japan", "Australia"],
        "answer": 0
      },
      {
        "question": "In which sport would you find a 'scrum'?",
        "options": ["Soccer", "Rugby", "Cricket", "Hockey"],
        "answer": 1
      },
      {
        "question":
            "Who holds the record for the most Grand Slam singles titles in tennis (as of 2024)?",
        "options": [
          "Roger Federer",
          "Serena Williams",
          "Rafael Nadal",
          "Novak Djokovic"
        ],
        "answer": 3
      },
      {
        "question":
            "What is the name of the championship trophy awarded in Major League Baseball?",
        "options": [
          "World Cup",
          "Commissioner's Trophy",
          "Stanley Cup",
          "Larry O'Brien Trophy"
        ],
        "answer": 1
      },
     
    ],
    [
      {
        "question": "What is the chemical symbol for gold?",
        "options": ["Au", "Ag", "Pb", "Fe"],
        "answer": 0
      },
      {
        "question": "What is the atomic number of carbon?",
        "options": ["6", "12", "14", "8"],
        "answer": 0
      },
      {
        "question":
            "Which element is commonly used in the production of stainless steel?",
        "options": ["Iron", "Copper", "Aluminum", "Zinc"],
        "answer": 0
      },
      {
        "question": "What is the pH of pure water at 25°C?",
        "options": ["7", "0", "14", "3"],
        "answer": 0
      },
      {
        "question":
            "What type of bond involves the sharing of electron pairs between atoms?",
        "options": [
          "Ionic Bond",
          "Covalent Bond",
          "Metallic Bond",
          "Hydrogen Bond"
        ],
        "answer": 1
      },
      {
        "question":
            "Which gas is most commonly used in the process of photosynthesis?",
        "options": ["Oxygen", "Nitrogen", "Carbon Dioxide", "Hydrogen"],
        "answer": 2
      },
      {
        "question": "What is the main component of natural gas?",
        "options": ["Ethane", "Methane", "Propane", "Butane"],
        "answer": 1
      },
      {
        "question": "What is the molecular formula for table salt?",
        "options": ["NaCl", "KCl", "MgO", "CaCO3"],
        "answer": 0
      },
      {
        "question": "Which element has the highest atomic number?",
        "options": ["Uranium", "Plutonium", "Oganesson", "Einsteinium"],
        "answer": 2
      },
      {
        "question":
            "In which type of reaction do reactants combine to form a single product?",
        "options": [
          "Decomposition",
          "Single Replacement",
          "Double Replacement",
          "Synthesis"
        ],
        "answer": 3
      }
    ],
    [
      {
        "question": "What is the value of π (pi) to two decimal places?",
        "options": ["3.12", "3.14", "3.16", "3.18"],
        "answer": 1
      },
      {
        "question": "What is the square root of 144?",
        "options": ["12", "14", "16", "18"],
        "answer": 0
      },
      {
        "question": "What is the formula for the area of a circle?",
        "options": ["πr²", "2πr", "πd", "4πr²"],
        "answer": 0
      },
      {
        "question":
            "In a right-angled triangle, which theorem is used to find the length of the hypotenuse?",
        "options": [
          "Pythagorean Theorem",
          "Fermat's Last Theorem",
          "Euler's Theorem",
          "Binomial Theorem"
        ],
        "answer": 0
      },
      {
        "question": "What is the sum of the angles in a triangle?",
        "options": ["90 degrees", "180 degrees", "360 degrees", "270 degrees"],
        "answer": 1
      },
      {
        "question":
            "If a sequence has a common difference of 3, what type of sequence is it?",
        "options": ["Geometric", "Arithmetic", "Harmonic", "Fibonacci"],
        "answer": 1
      },
      {
        "question": "What is 15% of 200?",
        "options": ["30", "20", "25", "35"],
        "answer": 0
      },
      {
        "question": "Which number is the smallest prime number?",
        "options": ["1", "2", "3", "4"],
        "answer": 1
      },
      {
        "question": "What is the value of 7 factorial (7!)?",
        "options": ["5040", "720", "3430", "2520"],
        "answer": 0
      },
      {
        "question": "What is the term for a number that is not divisible by 2?",
        "options": ["Prime", "Composite", "Odd", "Even"],
        "answer": 2
      }
    ],
    
  ];
  static List categories = [
    {"imageurl": "https://i.pinimg.com/564x/56/71/32/567132eacdcce7c19ae8646fbe142ff9.jpg",
     "category": "SPORTS", "questionNo": "10 Questions"},
    {"imageurl": "https://i.pinimg.com/564x/72/09/95/7209959cce4a08ccb2a739da81f3ccf5.jpg",
     "category": "CHEMISTRY", "questionNo": "10 Questions"},
    {"imageurl": "https://i.pinimg.com/564x/06/6d/01/066d01021f6941465b30837fd3a89e1e.jpg",
     "category": "MATHS", "questionNo": "10 Questions"},
    {"imageurl": "", "category": "BIOLOGY", "questionNo": "10 Questions"},
  ];
}

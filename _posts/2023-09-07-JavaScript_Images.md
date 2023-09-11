---
comments: true
layout: post
title: CityGuesser
description: This JavaScript program displays a satellite image of a random city with a population of 30,000 people or larger, and the goal of the game is to guess the city from this image. Each city correctly guessed adds one point, a wrong guess resets the score to zero. Currently, there are only cities from south and central California.
type: hacks
courses: {compsci: {week: 3}}
---

<style>
input[type=submit] {
  background-color: #86BB58;
  border: 2px solid #86BB58;
  color: white;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 12px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
  border-radius: 12px;
}
input[type=submit]:hover {
  background-color: white;
  border: 2px solid #86BB58;
  color: black;
}
input[type=text] {
  width: 130px;
  padding: 12px 10px;
  margin: 8px 0;
  box-sizing: border-box;
  border: 2px solid #86BB58;
  border-radius: 4px;
  transition: width 1s ease-in-out;
}
input[type=text]:focus {
    width: 67.5%;
    border: 4px solid #5E9443;
}
 
#title-animation {
width:200px;
height:65px;
background: #92B901;
color: #ffffff;
position: relative;
font-weight:bold;
font-size:30px;
padding:10px;
animation:title-animation 6s 1;
-moz-animation:title-animation 6s 1;
-webkit-animation:title-animation 6s 1;
-o-animation:title-animation 6s 1;
border-radius:5px;
-webkit-border-radius:5px;
animation-iteration-count: infinite;
}
@keyframes title-animation
{
0% {transform: rotate(360deg);left:0px;}
25% {transform: rotate(0deg);left:475px;}
50% {transform: rotate(0deg);left:475px;}
70% {transform: rotate(0deg);left:475px;background:#1ec7e6;}
100% {transform: rotate(-360deg);left:0px;}
}
@-webkit-keyframes title-animation
{
0% {-webkit-transform: rotate(360deg);left:0px;}
25% {-webkit-transform: rotate(0deg);left:475px;}
50% {-webkit-transform: rotate(0deg);left:475px;}
70% {-webkit-transform: rotate(0deg);left:475px;background:#1ec7e6;}
100% {-webkit-transform: rotate(-360deg);left:0px;}
}
@-moz-keyframes title-animation
{
0%  {-moz-transform: rotate(360deg);left:0px;}
25% {-moz-transform: rotate(0deg);left:475px;}
50%  {-moz-transform: rotate(0deg);left:475px;}
70%  {-moz-transform: rotate(0deg);left:475px;background:#1ec7e6;}
100% {-moz-transform: rotate(-360deg);left:0px;}
}
@-o-keyframes title-animation
{
0% {transform: rotate(360deg);left:0px;}
25% {transform: rotate(0deg);left:475px;}
50%  {transform: rotate(0deg);left:475px;}
70%  {transform: rotate(0deg);left:475px;background:#1ec7e6;}
100% {transform: rotate(-360deg);left:0px;}
}
</style>

<br>
<div id="title-animation">City Guesser</div>
<br>
<br>
<form id="textForm">
        <label for="textInput">Enter City:</label>
        <input type="text" id="textInput" required>
        <input type="submit" value="Guess!">
</form>
<div id="displayText"></div>
<div id="score"></div>
<div id="imageContainer"></div>

<script>
var Images = new Array()

var imageFilenames = [
    'Yuba City_CA.jpg',
    'Torrance_CA.jpg',
    'Vallejo_CA.jpg',
    'Bellflower_CA.jpg',
    'Simi Valley_CA.jpg',
    'Garden Grove_CA.jpg',
    'Brea_CA.jpg',
    'Citrus Heights_CA.jpg',
    'Montebello_CA.jpg',
    'Hayward_CA.jpg',
    'Monrovia_CA.jpg',
    'Antioch_CA.jpg',
    'Palo Alto_CA.jpg',
    'Rancho Palos Verdes_CA.jpg',
    'San Clemente_CA.jpg',
    'Vista_CA.jpg',
    'Alameda_CA.jpg',
    'Mission Viejo_CA.jpg',
    'Norwalk_CA.jpg',
    'Highland_CA.jpg',
    'Santa Rosa_CA.jpg',
    'Moreno Valley_CA.jpg',
    'Eureka_CA.jpg',
    'San Gabriel_CA.jpg',
    'Escondido_CA.jpg',
    'Watsonville_CA.jpg',
    'Arcadia_CA.jpg',
    'San Luis Obispo_CA.jpg',
    'San Pablo_CA.jpg',
    'Lake Forest_CA.jpg',
    'Galt_CA.jpg',
    'Anaheim_CA.jpg',
    'Brentwood_CA.jpg',
    'Glendora_CA.jpg',
    'Indio_CA.jpg',
    'Ridgecrest_CA.jpg',
    'Palm Desert_CA.jpg',
    'Novato_CA.jpg',
    'Orange_CA.jpg',
    'San Jose_CA.jpg',
    'San Francisco_CA.jpg',
    'Laguna Hills_CA.jpg',
    'Eastvale_CA.jpg',
    'Atascadero_CA.jpg',
    'Chula Vista_CA.jpg',
    'Buena Park_CA.jpg',
    'Diamond Bar_CA.jpg',
    'Lodi_CA.jpg',
    'Carlsbad_CA.jpg',
    'Lake Elsinore_CA.jpg',
    'Downey_CA.jpg',
    'Sacramento_CA.jpg',
    'El Monte_CA.jpg',
    'Thousand Oaks_CA.jpg',
    'Saratoga_CA.jpg',
    'Berkeley_CA.jpg',
    'Redding_CA.jpg',
    'Yorba Linda_CA.jpg',
    'Lancaster_CA.jpg',
    'Lynwood_CA.jpg',
    'Walnut_CA.jpg',
    'Rosemead_CA.jpg',
    'Rocklin_CA.jpg',
    'Lafayette_CA.jpg',
    'Pleasant Hill_CA.jpg',
    'La Quinta_CA.jpg',
    'Costa Mesa_CA.jpg',
    'Dana Point_CA.jpg',
    'Upland_CA.jpg',
    'Pomona_CA.jpg',
    'Tustin_CA.jpg',
    'San Rafael_CA.jpg',
    'Napa_CA.jpg',
    'South Gate_CA.jpg',
    'Union City_CA.jpg',
    'Lemon Grove_CA.jpg',
    'Santa Paula_CA.jpg',
    'Carson_CA.jpg',
    'San Jacinto_CA.jpg',
    'Newport Beach_CA.jpg',
    'Fullerton_CA.jpg',
    'Cupertino_CA.jpg',
    'Fairfield_CA.jpg',
    'Walnut Creek_CA.jpg',
    'Yucaipa_CA.jpg',
    'Paramount_CA.jpg',
    'Culver City_CA.jpg',
    'Norco_CA.jpg',
    'Adelanto_CA.jpg',
    'Los Banos_CA.jpg',
    'Seaside_CA.jpg',
    'Placentia_CA.jpg',
    'Hawthorne_CA.jpg',
    'West Covina_CA.jpg',
    'South Pasadena_CA.jpg',
    'Gardena_CA.jpg',
    'Dublin_CA.jpg',
    'Pico Rivera_CA.jpg',
    'San Juan Capistrano_CA.jpg',
    'Reedley_CA.jpg',
    'Coachella_CA.jpg',
    'South San Francisco_CA.jpg',
    'San Mateo_CA.jpg',
    'Long Beach_CA.jpg',
    'San Leandro_CA.jpg',
    'Santa Monica_CA.jpg',
    'Sunnyvale_CA.jpg',
    'Benicia_CA.jpg',
    'Barstow_CA.jpg',
    'Tracy_CA.jpg',
    'Rancho Cucamonga_CA.jpg',
    'La Habra_CA.jpg',
    'Livermore_CA.jpg',
    'Lompoc_CA.jpg',
    'Danville_CA.jpg',
    'San Marcos_CA.jpg',
    'La Mirada_CA.jpg',
    'Victorville_CA.jpg',
    'Cathedral City_CA.jpg',
    'Delano_CA.jpg',
    'Merced_CA.jpg',
    'Pleasanton_CA.jpg',
    'Moorpark_CA.jpg',
    'San Carlos_CA.jpg',
    'West Sacramento_CA.jpg',
    'San Diego_CA.jpg',
    'Beverly Hills_CA.jpg',
    'Glendale_CA.jpg',
    'Baldwin Park_CA.jpg',
    'Porterville_CA.jpg',
    'Santa Barbara_CA.jpg',
    'Chino Hills_CA.jpg',
    'Cerritos_CA.jpg',
    'Covina_CA.jpg',
    'Fremont_CA.jpg',
    'Corona_CA.jpg',
    'Chino_CA.jpg',
    'San Bruno_CA.jpg',
    'Huntington Beach_CA.jpg',
    'San Ramon_CA.jpg',
    'East Palo Alto_CA.jpg',
    'Stanton_CA.jpg',
    'Calexico_CA.jpg',
    'La Puente_CA.jpg',
    'Modesto_CA.jpg',
    'Lathrop_CA.jpg',
    'Twentynine Palms_CA.jpg',
    'Roseville_CA.jpg',
    'Burbank_CA.jpg',
    'San Bernardino_CA.jpg',
    'Inglewood_CA.jpg',
    'Newark_CA.jpg',
    'Santa Maria_CA.jpg',
    'Daly City_CA.jpg',
    'Morgan Hill_CA.jpg',
    'Beaumont_CA.jpg',
    'Lawndale_CA.jpg',
    'Elk Grove_CA.jpg',
    'Woodland_CA.jpg',
    'Foster City_CA.jpg',
    'Banning_CA.jpg',
    'Imperial Beach_CA.jpg',
    'Santa Clara_CA.jpg',
    'Alhambra_CA.jpg',
    'Redondo Beach_CA.jpg',
    'Poway_CA.jpg',
    'Camarillo_CA.jpg',
    'West Hollywood_CA.jpg',
    'Seal Beach_CA.jpg',
    'Gilroy_CA.jpg',
    'Redwood City_CA.jpg',
    'Compton_CA.jpg',
    'Pasadena_CA.jpg',
    'San Dimas_CA.jpg',
    'El Cerrito_CA.jpg',
    'Ontario_CA.jpg',
    'La Verne_CA.jpg',
    'Clovis_CA.jpg',
    'Bakersfield_CA.jpg',
    'Wildomar_CA.jpg',
    'Desert Hot Springs_CA.jpg',
    'Aliso Viejo_CA.jpg',
    'Monterey Park_CA.jpg',
    'El Cajon_CA.jpg',
    'Mountain View_CA.jpg',
    'Laguna Niguel_CA.jpg',
    'Fountain Valley_CA.jpg',
    'Chico_CA.jpg',
    'Monterey_CA.jpg',
    'Manteca_CA.jpg',
    'Santa Clarita_CA.jpg',
    'Folsom_CA.jpg',
    'Irvine_CA.jpg',
    'Oakley_CA.jpg',
    'Ceres_CA.jpg',
    'Menifee_CA.jpg',
    'Los Gatos_CA.jpg',
    'Santee_CA.jpg',
    'Fontana_CA.jpg',
    'Maywood_CA.jpg',
    'Martinez_CA.jpg',
    'Lakewood_CA.jpg',
    'Rancho Santa Margarita_CA.jpg',
    'Stockton_CA.jpg',
    'Manhattan Beach_CA.jpg',
    'Oakland_CA.jpg',
    'Claremont_CA.jpg',
    'Goleta_CA.jpg',
    'Temecula_CA.jpg',
    'Los Altos_CA.jpg',
    'Los Angeles_CA.jpg',
    'Hanford_CA.jpg',
    'Colton_CA.jpg',
    'Westminster_CA.jpg',
    'Milpitas_CA.jpg',
    'Burlingame_CA.jpg',
    'Suisun City_CA.jpg',
    'Santa Ana_CA.jpg',
    'Campbell_CA.jpg',
    'Montclair_CA.jpg',
    'Menlo Park_CA.jpg',
    'Redlands_CA.jpg',
    'Bell_CA.jpg',
    'Tulare_CA.jpg',
    'Oceanside_CA.jpg',
    'Atwater_CA.jpg',
    'Hesperia_CA.jpg',
    'Visalia_CA.jpg',
    'Temple City_CA.jpg',
    'Wasco_CA.jpg',
    'Windsor_CA.jpg',
    'Whittier_CA.jpg',
    'Salinas_CA.jpg',
    'El Centro_CA.jpg',
    'Lincoln_CA.jpg',
    'Hollister_CA.jpg',
    'Azusa_CA.jpg',
    'Pacifica_CA.jpg',
    'Fresno_CA.jpg',
    'Palmdale_CA.jpg',
    'Riverside_CA.jpg',
    'Palm Springs_CA.jpg',
    'National City_CA.jpg',
    'Jurupa Valley_CA.jpg',
    'Rohnert Park_CA.jpg',
    'Pittsburg_CA.jpg',
    'Concord_CA.jpg',
    'Petaluma_CA.jpg',
    'Vacaville_CA.jpg',
    'Davis_CA.jpg',
    'Perris_CA.jpg',
    'Sanger_CA.jpg',
    'Bell Gardens_CA.jpg',
    'Apple Valley_CA.jpg',
    'Santa Cruz_CA.jpg',
    'Lemoore_CA.jpg',
    'La Mesa_CA.jpg',
    'Richmond_CA.jpg',
    'Encinitas_CA.jpg',
    'Turlock_CA.jpg',
    'Brawley_CA.jpg',
    'Oxnard_CA.jpg',
    'Hercules_CA.jpg',
    'Madera_CA.jpg',
    'Cypress_CA.jpg',
    'Rancho Cordova_CA.jpg',
    'Hemet_CA.jpg',
    'Belmont_CA.jpg',
    'Huntington Park_CA.jpg',
    'Carson City_NV.jpg',
    'Enterprise_NV.jpg',
    'Henderson_NV.jpg',
    'Las Vegas_NV.jpg',
    'North Las Vegas_NV.jpg',
    'Pahrump_NV.jpg',
    'Reno_NV.jpg',
    'Sparks_NV.jpg',
    'Summerlin South_NV.jpg',
    'Sunrise Manor_NV.jpg',
    'Apache Junction_AZ.jpg',
    'Avondale_AZ.jpg',
    'Buckeye_AZ.jpg',
    'Bullhead City_AZ.jpg',
    'Casa Grande_AZ.jpg',
    'Chandler_AZ.jpg',
    'El Mirage_AZ.jpg',
    'Flagstaff_AZ.jpg',
    'Florence_AZ.jpg',
    'Gilbert_AZ.jpg',
    'Glendale_AZ.jpg',
    'Goodyear_AZ.jpg',
    'Kingman_AZ.jpg',
    'Lake Havasu City_AZ.jpg',
    'Marana_AZ.jpg',
    'Maricopa_AZ.jpg',
    'Mesa_AZ.jpg',
    'Oro Valley_AZ.jpg',
    'Peoria_AZ.jpg',
    'Phoenix_AZ.jpg',
    'Prescott Valley_AZ.jpg',
    'Prescott_AZ.jpg',
    'Queen Creek_AZ.jpg',
    'Sahuarita_AZ.jpg',
    'San Luis_AZ.jpg',
    'Scottsdale_AZ.jpg',
    'Sierra Vista_AZ.jpg',
    'Surprise_AZ.jpg',
    'Tempe_AZ.jpg',
    'Tucson_AZ.jpg',
    'Yuma_AZ.jpg'
];

var folderPath = '../../../images/cities';
imageFilenames.forEach(function (filename) {
    Images.push(folderPath + '/' + filename);
});

new_image = 1;
var whichImage;
var score = 0;
var j = 0;
var p = Images.length;
var preBuffer = new Array();
var state = "";
for (i = 0; i < p; i++){
   preBuffer[i] = new Image()
   preBuffer[i].src = Images[i]
}

function showImage(){
    whichImage = Math.round(Math.random() * (p - 1));
    var imageContainer = document.getElementById('imageContainer');
    var imageElement = document.createElement('img');
    imageElement.src = Images[whichImage];
    imageContainer.innerHTML = '';
    imageContainer.appendChild(imageElement);
}

showImage();


const textForm = document.getElementById('textForm');
const textInput = document.getElementById('textInput');
const displayText = document.getElementById('displayText');
const Score = document.getElementById('score');

var Abbreviations = [
    { abr: "CA", name: "California" },
    { abr: "NV", name: "Nevada" },
    { abr: "AZ", name: "Arizona" }
];

textForm.addEventListener('submit', function (e) {
    e.preventDefault();
    const enteredText = textInput.value;
    const stateAbbreviation = Images[whichImage].slice(-6, -4);

    for (var i = 0; i < Abbreviations.length; i += 1) {
        if (Abbreviations[i].abr === stateAbbreviation) {
            state = Abbreviations[i].name;
            break;
        }
    }
    if (enteredText == Images[whichImage].slice(23, -7)) {
        score = score + 1
        Score.textContent = 'Score: ' + score;
        displayText.textContent = 'Correct, the city was ' + Images[whichImage].slice(23, -7) + ', ' + state + '.';
    } else {
        displayText.textContent = 'Unfortunately, that was incorrect. The city was ' + Images[whichImage].slice(23, -7) + ', ' + state + ".";
        score = 0
        Score.textContent = 'Score: ' + score
    }
    showImage();
    textInput.value = '';
});

</script>
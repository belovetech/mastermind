const express = require('express');
const basicAuth = require('express-basic-auth');

const app = express();

data = {
  name: 'Frank Sinatra',
  songs: [
    'Ac-cent-tchu-ate the Positive',
    'Accidents Will Happen	',
    "After You've Gone",
    'All Alone',
    'All I Do Is Dream of You',
    'All I Need is the Girl',
    'All My Tomorrows',
    'All of Me',
    'All of You',
    'All the Way',
    'All the Way Home',
    'All This and Heaven Too',
    'All Through the Day',
    'Available',
    'A Baby Just Like You',
    "Baby, Won't You Please Come Home?",
    'The Bells of Christmas',
    'The Best of Everything',
    'Blame It on My Youth',
    'Blue Lace',
  ],
  birthDate: 'December 12, 1915',
  birthCity: 'Hoboken, New Jersey',
  wives: ['Nancy Barbato', 'Ava Gardner', 'Mia Farrow', 'Barbara Marx', ],
  imageURL:
    'https://en.wikipedia.org/wiki/Frank_Sinatra#/media/File:Frank_Sinatra2,_Pal_Joey.jpg',
};

const getRandomItem = arr => {
  const randomIndex = Math.floor(Math.random() * arr.length);
  return arr[randomIndex];
};

app.get('/', (req, res) => {
  const randomSong = getRandomItem(data.songs);

  res.send(`${randomSong} \n`);
});

app.get('/birth_date', (req, res) => {
  res.send(`${data.birthDate} \n`);
});

app.get('/birth_city', (req, res) => {
  res.send(`${data.birthCity} \n`);
});

app.get('/wives', (req, res) => {
  res.send(`${data.wives}`.split(',').join(', '));
});

app.get('/picture', (req, res) => {
  res.redirect(data.imageURL);
});

app.get('/public', (req, res) => {
  res.send('Everybody can see this page\n');
});
// Custom authorization
/*
const myAuthorizer = (username, password) => {
  const userMatch = basicAuth.safeCompare(username, 'admin');
  const pwdMatch = basicAuth.safeCompare(password, 'admin');

  return userMatch & pwdMatch;
};

app.use(basicAuth({ authorizer: myAuthorizer }));
*/

app.use(
  basicAuth({
    users: { admin: 'admin' },
    unauthorizedResponse: req => {
      return 'Not authorized\n';
    },
  })
);

app.get('/protected', async (req, res) => {
  if (req.headers.authorization) {
    const base64Credentials = req.headers.authorization.split(' ')[1];
    const credentials = Buffer.from(base64Credentials, 'base64').toString(
      'utf8'
    );
    const [username, password] = credentials.split(':');
    res.send('Welcome, authenticated client\n');
  }
});

const PORT = 8080;
app.listen(PORT, '127.0.0.1', () => {
  console.log(`LIstening on port ${PORT}`);
});

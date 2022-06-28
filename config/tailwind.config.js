const defaultTheme = require('tailwindcss/defaultTheme');

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
        pacifico: ['Pacifico', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        main: {
          100: '#3778c2',
          200: '#3975C8',
          300: '#3676C0',
          400: '#3574BA',
          500: '#3370B4',
          600: '#336EB2',
          700: '#2D64A4',
          800: '#2D639F',
          900: '#2D619D',
        },
        second: '#5fb523',
        'text-1': '#434b54',
        'text-2': '#555d67',
        'text-3': '#878a8f',
        'text-4': '#90959b',
        background: 'f1f3f2',
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ],
};


crater io post about helpful patterns, submit form, error, message, etc. use a reactive variable!


# Meteor Boilerplate

This repo is a boilerplate for meteor projects that have users, collections, and routing.

## Packages

- accounts-password
- coffeescript
- fastclick
- [lauricio:less-autoprefixer](https://github.com/lauricio/less-autoprefixer)
- [digilord:sugarjs](https://github.com/digilord/meteor-sugarjs.git)
- [wizonesolutions:underscore-string](https://github.com/wizonesolutions/meteor-underscore-string.git)
- [stevezhu:lodash](https://github.com/stevezhu/meteor-lodash.git)
- [anti:fake](https://github.com/anticoders/meteor-fake.git)
- [iron:router](https://github.com/eventedmind/iron-router)

* remove autopublish
* remove insecure

## Organization

### Client

All the files in the `client` folder are sent only to the client.

- `components` contain reusable code or widgets. As you can see, the "error" component is pretty simple and useful.
- `styles` contain your styleguides. These are reusable styles for you entire app that are not view-specific.
- `views` contain a folder for each view in your app. Each folder has a `.coffee`, `.html`, and `.import.less` file which are specific to this view.
- `head.html` contains the html head with all the meta tags and for a mobile-optimized web app.
- `helpers.coffee` contain global template helpers that are used throughout the app.
- `layout.html` contains the Iron Router layout, loading and notFound templates.
- `main.less` imports all other less files and defines less variables that are used in the imports.

### Lib

All the files in the `lib` folder are sent to both the client and the server and are loaded first.

- `methods.coffee` contain all the Meteor.methods. There given to the client and the server so the client can do latency compensation by simulating the method.
- `router.coffee` contains all the Iron Router configuration.
- `setup.coffee` is where you do any environment setup.
- `utils.coffee` is where you put any helper functions.

### Private

The private folder is where you put any server resources that should not be accessibly by the client. For lack of a better place, I put a `.sketch` file in there that I use to create all the necessary splash screens sizes and icon sizes.

### Public

All public static files are hosted in the `public` folder. Namely, fonts, images, videos, icons, and splash screens.

### Server

All the files in the `server` folder are sent only to the server.

- `accounts.coffee` contain any configuration for user accounts.
- `bootstrap.coffee` is where you can provide fake data to the server on startup.
- `kadira.coffee` simply contains your Kadira credentials when it comes time to start perfomance testing.
- `publish.coffee` is where you put all of your publications to the client.

## Patterns

Some important patterns to notice here is that we do not use allow-deny rules or do any collection updates from the client. Everything is done through a Meteor.method. This is much more scalable / sane to code because it gives you much more freedom.

You'll also see how to import fonts and icons, define less variables, and import other less files properly.


# To Do:
- local market animations between pages, and uihooks, and reoroder animations
- loading screen with spinner! codrops
- less style guide page
- responsive deisgn
- user profile page?
- email for recover password

- spiderable? fastrender?
- dynamically change title for SEO?


- collectionfs, gridfs, dropzone
- avatar and facebook sync

- splash screen iPhone 6, iPhone 6+, test all of them! Android splash screen, etc.

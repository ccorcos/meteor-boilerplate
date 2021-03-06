# Work in Progress

## To Do:

- when changing an image, reactively update the css XXXX
- fix css for images in leaderboard, whats the pattern for that
- make responsive design with break points / viewport stuff

- connect with facebook to get profile picture
- splash screen iPhone 6, iPhone 6+, test all of them! Android splash screen
- launch-screen? fast-render?
- test platforms

Later:
- email for recover password




# Meteor Boilerplate

This repo is a boilerplate for meteor projects that have users, collections, and routing.

I've left out all SEO stuff from this project because this app inherently runs behind a login. Thus spiderable is not necessary. 

The stylesheets basically give you the following format for a page:

    <template name="leaderboard">
      <div class="leaderboard page">
        <div class="nav">
          <div class="title">Title</div>
        </div>
        <div class="content under-nav above-toolbar">

        </div>
        <div class="toolbar">
          <div>toolbar</div>
        </div>
      </div>
    </template>

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
- [meteorhacks:subs-manager](https://github.com/meteorhacks/subs-manager)
- [reywood:publish-composite](https://github.com/englue/meteor-publish-composite/)
- [dburles:collection-helpers](https://github.com/dburles/meteor-collection-helpers)
- [matb33:collection-hooks](https://github.com/matb33/meteor-collection-hooks)
- [percolate:velocityjs](https://github.com/percolatestudio/meteor-velocityjs.git)
- [meteorhacks:fast-render](https://github.com/meteorhacks/fast-render)

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

- `collections.coffee` contains your collections, and collection hooks/helpers.
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



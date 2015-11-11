Meteor project boilerplate
===

A starting point for MeteorJS applications. Includes iron-router, CoffeeScript, Sass, Bourbon, and more, inspired by [meteor-boilerplate](https://github.com/Differential/meteor-boilerplate).

* [Included packages](#packages)
* Installation
  Paths to replace in project (find-replace all matches in project folder):
    1. [SERVER_IP_ADDRESS] - remote server IP or URL
    2. [SERVER_PASSWORD] - remote server password
    3. [path/to/your/app] - absolute path to repository root folder, i.e. `~/Projects/myproject`
    4. konar - project name, i.e. `mySuperProjectdb`, used as folder name for MongoDB logs/data and as MongoDB replica set name
    5. [SERVER_DB_NAME] - MongoDB database name, i.e. `mySuperProject`
    6. [SMTP_URL] - URL of SMTP used for email sending.
    7. [SMTP_LOGIN] - SMTP login
    8. [SMTP_PASSWORD] - SMTP password
    9. [MONGODB_PORT] - MongoDB binding port

* File Structure
* SEO
* Favicons and Touch Icons

## <a name="packages"></a> Included packages

### Admin-panel side:

* meteor-platform
* iron:router
* coffeescript
* fourseven:scss
* wolves:bourbon
* accounts-base
* accounts-password
* twbs:bootstrap
* fortawesome:fontawesome
* aldeed:collection2
* tap:i18n
* tap:i18n-db
* raix:handlebar-helpers
* reactive-var
* ansyg:i18n-admin
* ansyg:tap-i18n-schema
* aldeed:autoform@5.0.3
* yogiben:autoform-file
* cfs:standard-packages
* cfs:filesystem
* aldeed:autoform-select2
* mpowaga:autoform-summernote
* ongoworks:security
* stevezhu:lodash

### User side:

* meteor-platform
* spiderable
* coffeescript
* accounts-base
* accounts-password
* reactive-var
* iron:router
* fourseven:scss
* wolves:bourbon
* aldeed:collection2
* tap:i18n
* tap:i18n-db
* raix:handlebar-helpers
* ansyg:tap-i18n-schema
* martino:iron-router-i18n
* cfs:standard-packages
* cfs:filesystem
* manuel:viewmodel

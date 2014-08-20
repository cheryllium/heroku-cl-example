# Common Lisp on Heroku -- Example Project

## Changes From Forked Repository
Hello World example was not-functional, apparently because the build script
forgot to copy the "public" directory (containing all the static files)
into heroku's build directory for deployment.

The only change is fixing this bug to make the demo work out-of-the-box.

This project is an example of how to use the [Heroku Common Lisp Buildpack](https://github.com/mtravers/heroku-buildpack-cl).  See the buildpack repository for more information and credits.

## Instructions:
First, get yourself set up with a [Heroku account and tools](http://devcenter.heroku.com/articles/quickstart).

Then [fork this project](/mtravers/heroku-cl-example/fork_select) (and optionally modify it with your own content).

Next, create your own Heroku application using CL Buildpack:

    heroku create -s cedar --buildpack http://github.com/mtravers/heroku-buildpack-cl.git

And deploy:

    git push heroku

That's it!

## More details:

The file heroku-setup.lisp gets loaded at compile time, and needs to load any Lisp files or packages required.

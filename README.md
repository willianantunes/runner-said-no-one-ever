# Runner [#SaidNoOneEver](https://twitter.com/hashtag/SaidNoOneEver?src=hashtag_click)

Find a movie or a character from it and this API will reply to you as soon as possible #SaidNoOneEver.

## Running it

WIP.

## Purpose

The idea here is to delay 1 second or more (given you custom configuration) to answer a request, thus you can use this behavior for interesting tests, like dispatching 10 requests from you back-end to this service and do it efficiently with some approaches like through [Threads](https://en.wikipedia.org/wiki/Thread_(computing)#Thread_and_fiber_issues) or [Coroutines](https://en.wikipedia.org/wiki/Coroutine).

Why Sinatra? See more [here](https://www.ruby-toolbox.com/categories/web_app_frameworks). 

## Lessons learned

In order to create a project following Ruby conventions to organize a project, I executed the following command:

    bundle gem runner_said_no_one_ever --no-exe --no-coc --mit --test=rspec

After that, I deleted the following files:

```txt
runner_said_no_one_ever.gemspec
.travis.yml
bin
```

See more details [here](https://bundler.io/guides/creating_gem.html).

### Interesting links

- [How to create a Ruby API with Sinatra](https://x-team.com/blog/how-to-create-a-ruby-api-with-sinatra/)
- [Where does bundler store gems?](https://stackoverflow.com/a/32638896/3899136)
- [Create a custom RuboCop action](https://www.jetbrains.com/help/ruby/rubocop.html#rubocop_external_tool)
- [Make Rubocop Part of Your Tests](https://blog.trueheart78.com/ruby/2016/09/18/make-rubocop-part-of-your-tests.html)
- [sckott/usdaplantsapi](https://github.com/sckott/usdaplantsapi)
- [sckott/cchecksapi](https://github.com/sckott/cchecksapi)
- [syxanash/gitron](https://github.com/syxanash/gitron)
- [kuntoaji/sinator](https://github.com/kuntoaji/sinator)
- [T-Dnzt/booklist](https://github.com/T-Dnzt/booklist)

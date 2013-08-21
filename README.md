# lita-codereviews

**lita-codereviews** is a handler for [Lita][1] that lets you pair up members of a team for code reviews on a weekly basis.

## Installation

Add lita-codereviews to your Lita instance's Gemfile:

```ruby
gem 'lita-codereviews'
```

## Usage

Assign yourself or other people to a team:

```
Lita: I'm on team "The Junto".

Lita: Brandon Beacher is on team "The Junto".
```

See reviews for the week:

```
<You> Lita: code reviews

<Lita> Brandon Beacher is reviewing Jordan Killpack
       Daniel Rice is reviewing Blithe Rocher
       Zac Stewart is reviewing Brandon Beacher
       Don Pottinger is reviewing Daniel Rice
       Kurt Nelson is reviewing Zac Stewart
       Jordan Killpack is reviewing Don Pottinger
       Blithe Rocher is reviewing Kurt Nelson
```

Or just find out who you're reviewing or who's reviewing you:

```
<You> Lita: who am I reviewing?
<Lita> You: you are code reviewing Brandon Beacher


<You> Lita: who's code reviewing me?
<Lita> You: Kurt Nelson is code reviewing you.

<You> Lita: who is Jordan Killpack reviewing?
<Lita> You: Jordan Killpack is reviewing Don Pottinger
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[1]: https://github.com/jimmycuadra/lita

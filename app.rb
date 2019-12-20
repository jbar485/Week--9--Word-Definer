require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

get("/") do
  @words = Word.all
  erb(:words)
end

get("/words") do
  if params[:search]
    @words = Word.search(params[:search])
  else
    @words = Word.all
  end
  erb(:words)
end

get("/words/new") do
  erb(:new_word)
end

post("/words") do
  name = params[:word_name]
  word = Word.new(name,  nil)
  word.save()
  @words = Word.all()
  erb(:words)
end

get("/words/:id") do
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

get("/words/:id/edit") do
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end

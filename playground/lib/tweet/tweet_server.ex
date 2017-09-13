defmodule PlaygroundTweet.TweetServer do

    # The purpose of this server is so if the :tweet_server process dies
    # then it will be started back up by the supervisor

    # Genserver defines a set of functions to be implenented and ensures they are all implemented
    use GenServer

    def start_link() do
        GenServer.start_link(__MODULE__, :ok, name: :tweet_server)
    end

    def init(:ok) do
        {:ok, %{}}
    end

    def handle_cast({:tweet, tweet}, _) do
        PlaygroundTweet.Tweet.send(tweet)
        {:noreply, %{}}
    end

    def tweet(tweet) do
        GenServer.cast(:tweet_server, {:tweet, tweet})
    end
end

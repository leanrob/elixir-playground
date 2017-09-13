defmodule PlaygroundTweet.Scheduler do
    def schedule_file(schedule, file) do
        Quantum.add_job(schedule, fn -> PlaygroundTweet.FileReader.get_string_to_tweet(file)
    |> PlaygroundTweet.TweetServer.tweet end)
    end
end

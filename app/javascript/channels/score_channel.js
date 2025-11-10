import consumer from "channels/consumer"

consumer.subscriptions.create({ channel: "ScoreChannel", match_id: 1 },
    {
        received(data) {
            document.getElementById("score").innerText = data.score
        }
    });

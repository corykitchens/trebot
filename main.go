package main

import (
	"os"

	_ "github.com/corykitchens/trebot/trivia"
	"github.com/go-chat-bot/bot/slack"
)

func main() {
	slack.Run(os.Getenv("TREBOT_KEY"))
}

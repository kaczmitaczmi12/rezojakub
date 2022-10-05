local AutoBroadCast = GlobalEvent("text")
function AutoBroadCast.onThink(interval, lastExecution)
    local messages = {

    "[Daily Reward]: Using the !reward command you receive your daily reward",
    "[Facebook]: Follow us on Facebook! https://facebook.com/rezodus",

}
    Game.broadcastMessage(messages[math.random(#messages)], MESSAGE_GAME_HIGHLIGHT) 
    return true
end
AutoBroadCast:interval(900000)
AutoBroadCast:register()
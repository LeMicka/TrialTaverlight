/*void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)

{

    Player* player = g_game.getPlayerByName(recipient);

    if (!player) {

        player = new Player(nullptr);

        if (!IOLoginData::loadPlayerByName(player, recipient)) {

            return;

        }

    }

    Item* item = Item::CreateItem(itemId);

    if (!item) {

        return;

    }

    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline()) {

        IOLoginData::savePlayer(player);

    }

}*/


void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
    Player* player = g_game.getPlayerByName(recipient);

    if (!player) {
        player = new Player(nullptr);

        if (!IOLoginData::loadPlayerByName(player, recipient)) {
            delete player;      // Before leaving the function we have to free the memory created for the player
            return;
        }
    }
    Item* item = Item::CreateItem(itemId);

    if (!item) {
        delete player;          // If there is no Item, we free the memory of the player before leaving the function
        return;
    }

    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline()) {
        IOLoginData::savePlayer(player);
        // When the function ends we make sure to free the memory used in the function.
        delete item;
        delete player;
    }
}
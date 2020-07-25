const db = require("../functions/api/database");

async function setupDatabase(req, res, next) {
    // To delete all the collections
    const collections = ["id", "tasks"];
    collections.forEach(async (collection) => await deleteCollection(collection));

    // Add documents to the tasks collection
    addDocuments("tasks", [
        { title: "Get Some Water", user: Jahangir },
        { title: "Replace light bulb", user: Syed },
        { title: "Get Some Sunlight", user: Hassan },
        { title: "Get Some Exercise", user: Hasibul },
        { title: "Talk to Friends", user: Abdullah },
    ]);

    res.send("Setting Up Database.... Done ");
}

async function deleteCollection(collection) {
    const cref = db.firestore.collection(collection);
    const docs = await cref.listDocuments();
    docs.forEach((doc) => doc.delete());
}

function addDocuments(collection, docs) {
    docs.forEach((doc) => db.create(collection, doc));
}

module.exports = setupDatabase;
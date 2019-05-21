"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
class IndexController {
    index(req, res) {
        //res.send('Hello')
        res.json({ text: 'API Is /api/documents' });
    }
}
exports.indexController = new IndexController();

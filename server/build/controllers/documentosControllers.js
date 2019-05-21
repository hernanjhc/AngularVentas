"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const database_1 = __importDefault(require("../database"));
class DocumentosController {
    index(req, res) {
        //res.send('Documentos') 
        database_1.default.query('DESCRIBE tiposdocumento');
        res.json('tiposdocumentos');
    }
}
const documentosController = new DocumentosController();
exports.default = documentosController;

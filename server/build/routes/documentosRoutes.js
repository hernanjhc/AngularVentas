"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const documentosControllers_1 = __importDefault(require("../controllers/documentosControllers"));
class DocumentosRoutes {
    constructor() {
        this.router = express_1.Router();
        this.config();
    }
    config() {
        //this.router.get('/', (req, res) => res.send('Documentos'));
        this.router.get('/', documentosControllers_1.default.index);
    }
}
const documentosRoutes = new DocumentosRoutes();
exports.default = documentosRoutes.router;

"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const database_1 = __importDefault(require("../database"));
class DocumentosController {
    //public async getOne(req: Request, res: Response): Promise<void> {
    getOne(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            //res.json({text: 'Este es el tipo de documento ' + req.params.id});
            const { id } = req.params;
            const doc = yield database_1.default.query('select * from tiposdocumento where id = ?', [id]);
            console.log(doc); // leer resultado en terminal / RowDataPacket
            if (doc.length > 0) {
                return res.json(doc[0]);
            }
            //res.json({text: 'Tipo Documento encontrado'});
            res.status(404).json({ text: 'Tipo Documento no existe' });
        });
    }
    list(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            //res.send('Documentos') 
            //pool.query('DESCRIBE tiposdocumento');
            //res.json({text: 'Listando tipos de tiposdocumento'});
            const td = yield database_1.default.query('select * from tiposdocumento');
            res.json(td);
        });
    }
    create(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            //console.log(req.body);  
            //await: se toma el tiempo, cuándo termina continúa con lo siguiente
            yield database_1.default.query('insert into tiposdocumento set ?', [req.body]);
            res.json({ message: 'Tipo documento registrado' });
        });
    }
    delete(req, res) {
        res.json({ text: 'Eliminando el tipo de Documento ' + req.params.id });
    }
    update(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            //res.json({text: 'Actualizando tipo de Documento ' + req.params.id});
            //await pool.query('update tiposdocumento set TipoDocumento s')
        });
    }
}
const documentosController = new DocumentosController();
exports.default = documentosController;

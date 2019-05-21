import {Request, Response} from 'express';

class IndexController {

    public index (req: Request, res: Response) {
        //res.send('Hello')
        res.json({text: 'API Is /api/documents'});
    }
}

export const indexController = new IndexController();
import express from 'express';
import bodyParser from 'body-parser';

const app = express();
const PORT = 3000;
// parse application/json
app.use(bodyParser.json())

// app.use('/api/v1', orderRouter);
// app.use('/api/v1', walletRouter);
// app.use('/api/v1', smartContractRouter);
// app.use('/api/v1', transactionRouter)
// app.use('/api/v1', botRouter)

app.listen(PORT, () => {
    console.log(`API is started on port ${PORT}!`);
});

const express = require('express');
const helmet = require('helmet');
const cors = require('cors');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3000;

// Security middleware
app.use(helmet());
app.use(cors());
app.use(express.json());

// Health check endpoint
app.get('/health', (req, res) => {
  res.status(200).json({
    status: 'healthy',
    timestamp: new Date().toISOString(),
    uptime: process.uptime(),
    environment: process.env.NODE_ENV || 'development'
  });
});

// API routes
app.get('/api/info', (req, res) => {
  res.json({
    name: 'Training DevOps Application',
    version: '1.0.0',
    description: 'A training repository demonstrating DevOps practices',
    environment: process.env.NODE_ENV || 'development'
  });
});

// Root endpoint
app.get('/', (req, res) => {
  res.json({
    message: 'Welcome to the Training DevOps Application!',
    endpoints: {
      health: '/health',
      info: '/api/info'
    }
  });
});

// Error handling middleware
app.use((err, req, res, _next) => {
  console.error(err.stack); // eslint-disable-line no-console
  res.status(500).json({
    error: 'Something went wrong!',
    timestamp: new Date().toISOString()
  });
});

// 404 handler
app.use('*', (req, res) => {
  res.status(404).json({
    error: 'Route not found',
    path: req.originalUrl,
    timestamp: new Date().toISOString()
  });
});

// Start server
const server = app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`); // eslint-disable-line no-console
  console.log(`Environment: ${process.env.NODE_ENV || 'development'}`); // eslint-disable-line no-console
});

// Graceful shutdown
process.on('SIGTERM', () => {
  console.log('SIGTERM received, shutting down gracefully'); // eslint-disable-line no-console
  server.close(() => {
    console.log('Process terminated'); // eslint-disable-line no-console
  });
});

module.exports = app;
const { DataTypes } = require('sequelize');
const sequelize = require('../config/db.config');

const Score = sequalize.define(
  "Score", {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    user_id: {
      type: DataTypes.INTEGER,
      references: {
        model: 'user',
        key: 'id'
      }
    },
    score: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    game: {
      type: DataTypes.STRING,
      allowNull: false,
      defaultValue: DataTypes.NOW
    }
  },
  {
    sequelize,
    timestamps: false,
    freezeTableName: true,
    underscored: true,
    modelName: 'score'
  }
);

module.exports = Score;

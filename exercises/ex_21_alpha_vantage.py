import os
from dotenv import load_dotenv
from sqlalchemy import create_engine, MetaData, String, Integer, DateTime, Numeric, Date, ForeignKey
from sqlalchemy_utils import database_exists, create_database
from sqlalchemy.orm import DeclarativeBase, relationship, mapped_column, Mapped, Session, sessionmaker
from datetime import datetime, timezone
from typing import Optional
from alpha_vantage.timeseries import TimeSeries
from alpha_vantage.fundamentaldata import FundamentalData
import polars as pl

# Load environment variables from .env file
load_dotenv(override=True)

#########################################################################
# Part 1: define and create database connection
#########################################################################

# Define database connection properties
username = os.getenv('PG_USERNAME')
password = os.getenv('PG_PASSWORD')
host     = os.getenv('PG_HOSTNAME')
port     = os.getenv('PG_PORTNUM')
database = 'alpha'

# Create the connection URL
connection_url = f"postgresql://{username}:{password}@{host}:{port}/{database}"

# Create an engine
engine = create_engine(connection_url)

# If database does not exist, create it
if not database_exists(engine.url):
    create_database(engine.url)

print(database_exists(engine.url))

# Instantiate an empty metadata object
metadata = MetaData()

# Connect to the database and read in its metadata
metadata.reflect(bind=engine)

# CAUTION: drop all tables! (this is to clean the slate before our exercise)
metadata.drop_all(engine, checkfirst=True)

#########################################################################
# Part 2: define database model classes
#########################################################################

class Base(DeclarativeBase):
    pass
    
#########################################################################
# 
# Complete the CompanyData class below according to these requirements:
#
# asset_type: [str] with limit 50
# company_name: [str] & ADD AN INDEX!
# company_desc: [str] with limit 250
# exchange: [str] with limit 1000
# currency: [str] with limit 5
# country: [str] with limit 100
# sector: [str] with limit 100
# industry: [str] with limit 100
# address: [str] with limit 500
# 
#########################################################################

class CompanyData(Base):
    __tablename__ = 'companies'
    
    company_id: Mapped[int] = mapped_column(primary_key=True)
    symbol: Mapped[str] = mapped_column(String(10), unique=True)
    # 
    # 
    # 
    # 
    # 
    # 
    # 
    # 
    # 
    created_at: Mapped[datetime] = mapped_column(DateTime, default=datetime.now(timezone.utc))
    
    # Define the FK relationship to the other table
    
    time_series: Mapped[list["PriceData"]] = relationship(back_populates="company")
    
    # Use Mapped[List[...]] when the attribute represents a collection of 
    # related objects. This is typical for the "parent" side of a one-to-many 
    # relationship. In this case, we are saying that one company should have
    # many rows in the PriceData class. Hence, the usage of List[...} here.
    
    def __repr__(self):
      return f"Company(id={self.company_id}, name={self.company_name})"
    
#########################################################################
# 
# Complete the PriceData class below according to these requirements:
#
# ts_id: [int] PRIMARY KEY
# symbol: [str] with limit 10
# date: [date] & ADD AN INDEX!
# high_price [float] with (12,4)
# low_price [float] with (12,4)
# close_price [float] with (12,4)
# volume: [int]
# created_at [datetime] using same syntax as companies table
#
# Using the example from above, can you also create the relationship to 
# the other table?
#
# NOTE: Don't worry about the __repr__ stuff below. A repr is just the string
# representation of an object in Python OOP.
# 
#########################################################################

class PriceData(Base):
    __tablename__ = 'time_series'
    
    # 
    company_id: Mapped[int] = mapped_column(ForeignKey('companies.company_id'), index=True)
    #
    # 
    open_price: Mapped[float] = mapped_column(Numeric(12, 4))
    # 
    #
    #
    #
    # 
    
    company: Mapped[...] = relationship(...)
    
    def __repr__(self):
      return f"Time series(id={self.ts_id}, symbol={self.symbol}, date={self.date})"
    
# Create all tables
Base.metadata.create_all(engine)


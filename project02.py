from sqlalchemy import create_engine , Column , Integer , String, Text , ForeignKey 
from sqlalchemy.orm import sessionmaker , DeclarativeBase 

class BASE(DeclarativeBase):
    pass

class User(BASE):
    __tablename__ = "students"
    
    id = Column(Integer, primary_key=True)
    name = Column(String(32), nullable=False)
    email = Column(String(32), unique=True, nullable=False)
    
class Task(BASE):
    __tablename__ = "tasks"
    
    id = Column(Integer , primary_key=True)
    title = Column(String(128), nullable=False)
    status = Column(Text)
    user_id = Column(Integer, ForeignKey("users.id"))
    
engine = create_engine("sqlite:///pupils.db")   
BASE.metadata.create_all(engine)
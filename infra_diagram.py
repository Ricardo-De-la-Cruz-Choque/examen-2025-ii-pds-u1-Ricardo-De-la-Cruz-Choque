# infra_diagram.py
from diagrams import Diagram, Cluster
from diagrams.aws.compute import EC2
from diagrams.aws.database import RDS
from diagrams.aws.network import ELB

with Diagram("Infraestructura Básica", show=False, filename="infra_diagram"):
    lb = ELB("Load Balancer")
    with Cluster("Backend"):
        backend = [EC2("API"), EC2("Auth")]
    db = RDS("Database")

    lb >> backend >> db

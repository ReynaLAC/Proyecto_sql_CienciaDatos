select count(Id) as número, gender from atletas group by gender;
select count(TaekwondoID) as número, genero from J_olimpicos group by genero;
select count(Id_coach), gender from coach group by gender;
###################
select category, weight, count(Id) as atletas from atletas group by weight, category;
select count(TaekwondoID) as atletas, peso, genero from J_olimpicos group by peso, genero;
#################
select current_date(), birthday, datediff(current_date(), birthday)/365 from J_olimpicos;
select count(TaekwondoID), round(datediff(current_date(), birthday)/365) as edad 
from J_olimpicos group by edad order by edad;
select count(Id), round(datediff(current_date(), day_of_birth)/365) as edad 
from atletas group by edad order by edad;
select count(Id_coach), round(datediff(current_date(), birthday)/365) as edad 
from coach group by edad order by edad;
######################################################
######################################################
######################################################
select count(Id) as atletas,nation from atletas group by nation order by count(Id) desc limit 50;
select name, count(Id) from atletas group by name order by name;
select * from atletas order by name;
########
select count(TaekwondoID) as atletas , pais from J_olimpicos group by pais order by atletas desc;
########
select count(Id_coach) as entrenadores, country 
from coach group by country order by entrenadores desc limit 50;
#########
select medalla, atleta from J_olimpicos;
select atleta, coach from coach_athetas;
select name, points from atletas;
select name, points from coach;
####
select J_olimpicos.atleta, J_olimpicos.medalla, coach_athetas.coach
 from J_olimpicos 
 inner join coach_athetas on upper(J_olimpicos.atleta) = upper(coach_athetas.atleta);
######

select atletas.points, J_olimpicos.atleta, J_olimpicos.medalla, coach_athetas.coach, coach.points
from J_olimpicos 
left join coach_athetas on upper(J_olimpicos.atleta) = upper(coach_athetas.atleta)
left join atletas on upper(atletas.name) = upper(J_olimpicos.atleta)
left join coach on upper(coach_athetas.coach) = upper(coach.name);
######

select name, count(name) cc from atletas group by name having cc>1;
select name, max(points) puntos from atletas group by name;
create view pruebita as select name, max(points) puntos from atletas group by name;
select name, count(name) cc from pruebita group by name having cc>1;
select name, count(*) cc from pruebita group by name having cc=1;

select atleta, coach from coach_athetas;
select atleta, coach from coach_athetas group by atleta, coach;
create view C_A as select atleta, coach from coach_athetas group by atleta, coach;
select * from C_A;
select coach, count(*) cc from C_A group by coach having cc=1;

select pruebita.puntos, J_olimpicos.atleta, J_olimpicos.medalla, C_A.coach, coach.points
from J_olimpicos 
left join C_A on upper(J_olimpicos.atleta) = upper(C_A.atleta)
left join pruebita on upper(J_olimpicos.atleta) = upper(pruebita.name)
left join coach on upper(coach.name) = upper(C_A.coach);


create view corazon as
select  J_olimpicos.atleta, J_olimpicos.medalla, C_A.coach
from J_olimpicos 
inner join C_A on upper(J_olimpicos.atleta) = upper(C_A.atleta);
select * from corazon;
##########
select pruebita.puntos, corazon.atleta, corazon.medalla, corazon.coach, coach.points
from corazon
left join pruebita on upper(corazon.atleta) = upper(pruebita.name)
left join coach on upper(corazon.coach) = upper(coach.name);

################
#################
######################
#######################
####################
##################
###################

select J_olimpicos.atleta, J_olimpicos.medalla, atletas.points
 from J_olimpicos 
 left join atletas on upper(J_olimpicos.atleta) = upper(atletas.name);
 
select J_olimpicos.atleta, J_olimpicos.medalla, atletas.points
 from atletas 
 left join J_olimpicos on upper(J_olimpicos.atleta) = upper(atletas.name) limit 50; 
 
 ###########
 ########
 select distinct coach, atleta from coach_athetas where atleta in 
 (select atleta from J_olimpicos where medalla="oro" and anio="2021");
 select atleta from J_olimpicos where medalla="oro" and anio="2021";
  ########MEdalla/pais/año
select anio, medalla from J_olimpicos 
  where pais in (select pais from J_olimpicos where pais="Spain") order by anio;
select anio, medalla from J_olimpicos 
  where pais in (select pais from J_olimpicos where pais="Korea") order by anio;
select anio, medalla from J_olimpicos 
  where pais in (select pais from J_olimpicos where pais="Mexico") order by anio;
select anio, medalla from J_olimpicos 
  where pais in (select pais from J_olimpicos where pais="Russian Federation") order by anio;
 select anio, medalla from J_olimpicos 
  where pais in (select pais from J_olimpicos where pais="China") order by anio;
select anio, medalla from J_olimpicos 
  where pais in (select pais from J_olimpicos where pais="United State of America") order by anio;
    ############
select name, points, nation from atletas order by points desc limit 25;
select nation, count(nation) as altos_puntajes from atletas where Id<25 
group by nation order by altos_puntajes desc;
select nation, sum(points) from atletas group by nation order by sum(points) desc limit 25;
##################
select atleta, anio, year(birthday), anio-year(birthday) from J_olimpicos;
select anio-year(birthday) as edad, count(anio-year(birthday)) as num_atletas 
from J_olimpicos group by anio-year(birthday) order by anio-year(birthday);
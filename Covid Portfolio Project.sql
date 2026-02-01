Select *
From CovidDeaths
Order by 3,4

Select *
From CovidVaccinations
Order by 3,4

-- Looking at the chances of dying if you got covid in a specific region
-- We'd have to divide total_deaths by total_cases and multiply by 100 to get the percentage
Select location, population,
Max(total_cases) As HighestInfectionCount, Max(cast(total_cases as float)/population)*100 As InfectionRate
From CovidDeaths
Group by location, population 
Order by InfectionRate Desc

-- Continents with the highest death count
Select location, Max(total_deaths) As TotalDeaths
From CovidDeaths
Where continent is null
Group by location
Order by TotalDeaths Desc

-- Global Data
Select sum(new_cases) as total_cases, sum(new_deaths) as total_deaths, 
(sum(cast(new_deaths as float))/sum(new_cases))*100 as DeathPercentage
From CovidDeaths
Where continent is not null

Select *
From CovidDeaths dea
Join CovidVaccinations vac
on dea.location = vac.location
and dea.date = vac.date
where dea.location = 'Kenya'

-- Total population vs vaccinated
Select dea.location,max(population) as TotPopulation, max(total_vaccinations) as TotVaccinations, 
(max(cast(total_vaccinations as float))/max(population))*100 As RateVaccinated
From CovidDeaths dea
Join CovidVaccinations vac
on dea.location = vac.location
and dea.date = vac.date
Where dea.continent is not null
group by dea.location
Order by 1

-- Let's use SUM
Select dea.location,dea.date,dea.population,vac.new_vaccinations,
Sum(vac.new_vaccinations)Over(Partition by dea.location Order by dea.date) as RollingPeopleVaccinated
From CovidDeaths dea
Join CovidVaccinations vac
on dea.location = vac.location
and dea.date = vac.date
Where dea.continent is not null
Order by 1

-- Create a CTE
With PopvsVac (location, date, population, new_vaccinations, RollingPeopleVaccinated)
as
(
Select dea.location,dea.date,dea.population,vac.new_vaccinations,
Sum(vac.new_vaccinations)Over(Partition by dea.location Order by dea.date) as RollingPeopleVaccinated
From CovidDeaths dea
Join CovidVaccinations vac
on dea.location = vac.location
and dea.date = vac.date
Where dea.continent is not null
-- Order by 1
)

Select *, (cast(RollingPeopleVaccinated as float)/population)*100
From PopvsVac

-- Create Views that will later be used in Visualization in Tableu or PowerBI
Create view RateVaccinated as 
Select dea.location,max(population) as TotPopulation, max(total_vaccinations) as TotVaccinations, 
(max(cast(total_vaccinations as float))/max(population))*100 As RateVaccinated
From CovidDeaths dea
Join CovidVaccinations vac
on dea.location = vac.location
and dea.date = vac.date
Where dea.continent is not null
group by dea.location
--Order by 1

Select *
From RateVaccinated
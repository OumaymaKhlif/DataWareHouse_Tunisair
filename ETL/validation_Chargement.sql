conn  UTL_TCP.connection;
   result INTEGER;

DECLARE
   CURSOR c_fait_vol IS
      SELECT ID_vol, ID_typeVol, DATE, DepartureCode, Delay, passengersTotal, passengersEco,
             passengersPremEco, passengersBusiness, passengersFirstClass, revenueTotal
      FROM fait_vol;

BEGIN
   conn := UTL_TCP.open_connection('localhost', 3306); 
   -- Sélection de la base de données tunisair
   EXECUTE IMMEDIATE 'USE tunisair';

   FOR rec IN c_fait_vol LOOP
      -- Vérification si les colonnes sont vides
      IF rec.ID_vol IS NULL OR TRIM(rec.ID_vol) = '' THEN
         RAISE_APPLICATION_ERROR(-20003, 'Error: ID_vol cannot be empty.');
      END IF;

      IF rec.ID_typeVol IS NULL OR TRIM(rec.ID_typeVol) = '' THEN
         RAISE_APPLICATION_ERROR(-20004, 'Error: ID_typeVol cannot be empty.');
      END IF;

      IF rec.DATE IS NULL OR TRIM(rec.DATE) = '' THEN
         RAISE_APPLICATION_ERROR(-20005, 'Error: DATE cannot be empty.');
      END IF;

      IF rec.DepartureCode IS NULL OR TRIM(rec.DepartureCode) = '' THEN
         RAISE_APPLICATION_ERROR(-20006, 'Error: DepartureCode cannot be empty.');
      END IF;

      IF rec.Delay IS NULL OR TRIM(rec.Delay) = '' THEN
         RAISE_APPLICATION_ERROR(-20007, 'Error: Delay cannot be empty.');
      END IF;

      IF rec.passengersTotal IS NULL OR rec.passengersTotal <= 0 THEN
         RAISE_APPLICATION_ERROR(-20008, 'Error: passengersTotal must be positive.');
      END IF;

      IF rec.passengersEco IS NULL OR rec.passengersEco < 0 THEN
         RAISE_APPLICATION_ERROR(-20009, 'Error: passengersEco must be non-negative.');
      END IF;

      IF rec.passengersPremEco IS NULL OR rec.passengersPremEco < 0 THEN
         RAISE_APPLICATION_ERROR(-20010, 'Error: passengersPremEco must be non-negative.');
      END IF;

      IF rec.passengersBusiness IS NULL OR rec.passengersBusiness < 0 THEN
         RAISE_APPLICATION_ERROR(-20011, 'Error: passengersBusiness must be non-negative.');
      END IF;

      IF rec.passengersFirstClass IS NULL OR rec.passengersFirstClass < 0 THEN
         RAISE_APPLICATION_ERROR(-20012, 'Error: passengersFirstClass must be non-negative.');
      END IF;

      IF rec.revenueTotal IS NULL OR rec.revenueTotal < 0 THEN
         RAISE_APPLICATION_ERROR(-20013, 'Error: revenueTotal must be non-negative.');
      END IF;

      -- Vérification du format de la colonne DATE (dd-MM-yy)
      BEGIN
         IF TO_DATE(rec.DATE, 'DD-MM-YY') IS NULL THEN
            RAISE_APPLICATION_ERROR(-20014, 'Error: DATE format must be dd-MM-yy.');
         END IF;
      EXCEPTION
         WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20014, 'Error: Invalid DATE format.');
      END;

      -- Vérification que la colonne Delay est positive
      IF rec.Delay <= 0 THEN
         RAISE_APPLICATION_ERROR(-20015, 'Error: Delay must be positive.');
      END IF;
   END LOOP;

   COMMIT; 
EXCEPTION
   WHEN OTHERS THEN
      ROLLBACK; 
      DBMS_OUTPUT.put_line(SQLERRM);
END;

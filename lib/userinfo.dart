

double gettax(int age, double inc) {


  int taxschedule;

  if (age <= 60) {
    taxschedule = 1;
  } else if (age > 60 && age <= 80) {
    taxschedule = 2;
  } else {
    taxschedule = 3;
  }

  double tax = 0;
  switch (taxschedule) {
    case 1:
      if (inc <= 250000) {
        tax = 0;
      } else if (inc > 250000 && inc <= 500000) {
        tax = (0.05) * (inc - 250000);
      } else if (inc > 500000 && inc <= 1000000) {
        tax = (0.05) * 250000 + (0.20) * (inc - 500000);
      } else {
        tax = (0.05) * 250000 + (0.20) * 500000 + (0.30) * (inc - 1000000);
      }

      break;
    case 2:
      if (inc <= 300000) {
        tax = 0;
      } else if (inc > 300000 && inc <= 500000) {
        tax = (0.05) * (inc - 300000);
      } else if (inc > 500000 && inc <= 1000000) {
        tax = (0.05) * 200000 + (0.20) * (inc - 500000);
      } else {
        tax = (0.05) * 200000 + (0.20) * 500000 + (0.30) * (inc - 1000000);
      }

      break;
    case 3:
      if (inc <= 500000) {
        tax = 0;
      } else if (inc > 500000 && inc <= 1000000) {
        tax = (0.20) * (inc - 500000);
      } else {
        tax = (0.20) * 500000 + (0.30) * (inc - 1000000);
      }
      break;
  }

  return tax;

}


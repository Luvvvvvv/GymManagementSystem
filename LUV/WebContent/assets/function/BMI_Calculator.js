var BMI = {};
BMI.getBMI = function (a, b) {
  var bmi = b / ((a / 100) * (a / 100));
  return bmi;
};
BMI.idealweight = function (a) {
  var x = (a - 100) * 0.9;
  return x;
};

function Cal(form) {
  var a = eval(form.height.value);
  var b = eval(form.weight.value);
  var bmiValue = BMI.getBMI(a, b);
  BMI.disp_alert(bmiValue);
  form.IW.value = BMI.idealweight(a);
  form.BMI.value = bmiValue;
}

BMI.disp_alert = function (bmi) {
  if (bmi < 18.5) {
    document.getElementById('conclusion').innerHTML = '�������̫��,Ҫ��Ե�Ӵ!';
  } else if (bmi >= 18.5 && bmi < 25) {
    document.getElementById('conclusion').innerHTML = '�����������,Ҫ��������Ӵ!';
  } else if (bmi >= 25 && bmi < 30) {
    document.getElementById('conclusion').innerHTML = '������ع���,Ҫ������!';
  } else if (bmi > 30) {
    document.getElementById('conclusion').innerHTML = '���Ͽ�ʼ���ʰ�!';
  } else {
    document.getElementById('conclusion').innerHTML = '��������ߺ�����!';
  }
}
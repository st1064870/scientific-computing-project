%kron(eye(3), toeplitz([30 -16 1 zeros(1,1)])) + kron(toeplitz([24 -12 zeros(1,1)]), eye(4))

function Y = b2t(A, m, n)
  Y = tensor;
  
  for i = 1:n
   Y(1:m,1:m,i,i)=A((i-1)*m+1:i*m, (i-1)*m+1:i*m);
  end
  
  for i = 2:n
      for j = 1:n-1
        Y(1:m,1:m,i,j)=A((i-1)*m+1:i*m, (j-1)*m+1:j*m);
      end
  end
  
  for i = 1:n-1
      for j = 2:n
        Y(1:m,1:m,i,j)=A((i-1)*m+1:i*m, (j-1)*m+1:j*m);
      end
  end
  
  Y=sptensor(Y);
end
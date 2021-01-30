function a = mask_band(n, type, p, q)
  if (type == 'band')
    e = ones(p+q,n);
    a = full(spdiags(e,-p:q,n,n));
  end
    
  if (type == 'btdr')
    b = full(kron(speye(n),ones(p)));
    a = b(1:n,1:n);
  end
end